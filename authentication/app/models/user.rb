class User < Actor

  field :created_by_omniauth, :type => Boolean, :default => false

  attr_accessible :email, :password, :password_confirmation,
                  :remember_me, :username, :plugins, :login

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :timeoutable
  devise :database_authenticatable, :registerable,  :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable

  references_many :user_tokens, :autosave => true

  class << self
    # Find user by email or username.
    # https://github.com/plataformatec/devise/wiki/How-To:-Allow-users-to-sign_in-using-their-username-or-email-address
    def find_for_database_authentication(conditions)
      login = conditions.delete(:login)
      self.any_of({ :username => login }, { :email => login }).first
    end

    def find_by_email(email)
      where(:email => email).first
    end

    def find_by_reset_password_token(reset_password_token)
      where(:reset_password_token => reset_password_token).first
    end

#    def find_for_facebook_oauth(access_token, signed_in_resource=nil)
#      data = access_token['extra']['user_hash']
#      if user = User.find_by_email(data["email"])
#        user
#      else # Create an user with a stub password.
#        User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
#      end
#    end

#    def new_with_session(params, session)
#      super.tap do |user|
#        if data = session[:omniauth]
#          omniauth_params = {:provider => data['provider'], :uid => data['uid']}
#          if credentials = data['credentials']
#            omniauth_params.merge!(:token => credentials['token']) unless credentials['token'].blank?
#            omniauth_params.merge!(:secret => credentials['secret']) unless credentials['secret'].blank?
#          end
#          token = self.user_tokens.build( omniauth_params )
#          token.save #(:validate => false) if (t[:id].blank? rescue true)
#          token
#        end
#      end
#    end

    def new_with_session(params, session)
      super.tap do |user|
        if omniauth = session[:omniauth]
          #user.user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
          user.apply_omniauth(omniauth)
        end
      end
    end

    # Alternatively, you could overwrite Devise's password_required? method
    def omniauth_initialization
      password = Devise.friendly_token[0,20]
      new :password => password,
          :password_confirmation => password,
          :created_by_omniauth => true
    end

  end

  def provider(name)
    self.user_tokens.find_by_provider(name.to_s) rescue nil
  end

  def apply_omniauth(omniauth)
    return if omniauth['provider'].blank? || omniauth['uid'].blank?
    #add some info about the user
    self.apply_user_info(omniauth['user_info'], omniauth['provider']) if omniauth['user_info']
    # Build the user token
    omniauth_params = self.build_omniauth_params(omniauth)
    if token = self.user_tokens.where(:provider => omniauth['provider'], :uid => omniauth['uid']).first
      debugger
      token.update_attributes(omniauth_params)
    else
      user_tokens.build(omniauth_params)
    end
    self.save unless self.new_record?
  end

  # Custom logic for adding user information from third party authentications
  def apply_user_info(info, provider = nil)
    if self.username.blank? && !info['nickname'].blank?
      # set username to third party nickname if available
      self.username = info['nickname'] if self.username.blank?
    end
    if self.email.blank? && !info['email'].blank?
      self.email = info['email'] if self.email.blank?
      # otherwise just set username to email address
      self.username = self.email if self.username.blank?
    end
  end

  def build_omniauth_params(omniauth)
    omniauth_params = {:provider => omniauth['provider'].to_s, :uid => omniauth['uid']}
    unless omniauth['credentials'].blank?
      credentials = omniauth['credentials']
      omniauth_params.merge!(:token => credentials['token']) unless credentials['token'].blank?
      omniauth_params.merge!(:secret => credentials['secret']) unless credentials['secret'].blank?
    end
    # Store all of the data for debugging and development
    omniauth_params.merge!(:omniauth => omniauth['extra'].except('access_token'))
    return omniauth_params
  end

#  def apply_omniauth(omniauth)
#    #add some info about the user
#    #self.name = omniauth['user_info']['name'] if name.blank?
#    #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?
#    self.email = omniauth['user_info']['email'] if self.email.blank?
#    unless omniauth['credentials'].blank?
#      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
#      #user_tokens.build(:provider => omniauth['provider'],
#      #                  :uid => omniauth['uid'],
#      #                  :token => omniauth['credentials']['token'],
#      #                  :secret => omniauth['credentials']['secret'])
#    else
#      user_tokens.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
#    end
#    #self.confirm!# unless user.email.blank?
#  end

#  def apply_omniauth(omniauth)
#    self.login = omniauth['user_info']['name'] if login.blank?
#    self.login = omniauth['user_info']['nickname'] if login.blank?
#    user_tokens.build(:provider => omniauth['provider'],
#                      :token => omniauth['credentials']['token'],
#                      :secret => omniauth['credentials']['secret'],
#                      :uid => omniauth['uid'])
#  end

#  def apply_omniauth(omniauth)
#    #add some info about the user

#    fbinfo = ::Hashie::Mash.new((omniauth["user_info"] rescue {}))

#    access_token = omniauth["credentials"]["token"] rescue nil

#    #raise "Can't authorize!" unless valid_facebook_auth? fbinfo

#    #self.facebok_id = fbinfo.id
#    self.email ||= fbinfo.email
#    self.first_name ||= fbinfo.first_name
#    self.last_name ||= fbinfo.last_name
#    #self.password ||= Devise.friendly_token[0,40]
#    #self.birthday = Date.parse(fbinfo.birthday) rescue nil
#    if changed? && !email.blank? && self.save(:validate => false)
#      Rails.logger.warn "Persisting user failed: #{self.to_s} with errors:\n#{self.errors.full_messages.join("\n")}\n\n"
#    end

#    #self.name = omniauth['user_info']['name'] if name.blank?
#    #self.nickname = omniauth['user_info']['nickname'] if nickname.blank?
#    save(:validate => false)
#    t = UserToken.find_or_initialize_by(:provider => omniauth['provider'], :uid => omniauth['uid'])
#    t.apply_omniauth(omniauth)
#    t
#  end

#  def password_required?
#    (user_tokens.empty? || !password.blank?) && super
#  end

  # Causes editing user without password to fail
#  def password_required?
#    ((user_tokens.empty? || !password.blank?) rescue nil) || super
#  end

#  def acceptible?
#    (valid? && active?) rescue false
#  end



#  def facebook_client
#    @fb_client ||= FBGraph::Client.new(
#                                       :client_id => Appconf.integrations.facebook.id,
#                                       :secret_id => Appconf.integrations.facebook.secret)
#                                       if t = (provider(:facebook).token rescue nil)
#                                         @fb_client.set_token(t)
#                                       else
#                                         @fb_client
#                                       end
#  end


  # BEGIN https://github.com/holden/devise-omniauth-example
  # https://github.com/holden/devise-omniauth-example/blob/master/app/models/user.rb





  # https://github.com/shingara/base_app_mongoid/blob/master/app/models/user.rb





  # END https://github.com/holden/devise-omniauth-example

  # https://github.com/wink/backbone/blob/master/app/models/person.rb
#  def self.find_for_facebook_registration(fb_data, signed_in_resource=nil)
#    data = fb_data['registration']
#    if person = self.where(:email => data["email"]).first
#      person
#    else # Create a person with a stub password.
#      self.create!(
#        :email => data['email'],
#        :name => data['name'],
#        :facebook_uid => fb_data['user_id'],
#        :facebook_token => fb_data['oauth_token'],
#        :location_name => data['location']['name'],
#        :location_id => data['location']['id'],
#        :birthday => data['birthday'].present? ? Date.parse(data['birthday']) : nil,
#        :gender => data['gender'],
#        :password => Devise.friendly_token[0,20]
#      )
#    end
#  end

end

# Schema provided under omniauth.auth
# Fields marked required will always be present

#  provider (required) - The provider with which the user authenticated (e.g. 'twitter' or 'facebook')
#  uid (required) - An identifier unique to the given provider, such as a Twitter user ID
#  user_info (required) - A hash containing information about the user
#   name (required) - The best display name known to the strategy. Usually a concatenation of first and last name, but may also be an arbitrary designator or nickname from some systems
#   email - The e-mail of the authenticating user. Should be provided if at all possible (but some sites such as Twitter do not provide this information)
#   nickname - The username of an authenticating user (such as your @-name from Twitter or GitHub account name)
#   first_name
#   last_name
#   location - The general location of the user, usually a city and state.
#   description - A short description of the authenticating user.
#   image - A URL representing a profile image of the authenticating user. Where possible, should be specified to a square, roughly 50x50 pixel image.
#   phone - The telephone number of the authenticating user (no formatting is enforced).
#   urls - A hash containing key value pairs of an identifier for the website and its URL. For instance, an entry could be "Blog" => "http://intridea.com/blog"
#  credentials - If the authenticating service provides some kind of access token or other credentials upon authentication, these are passed through here.
#   token - Supplied by OAuth and OAuth 2.0 providers, the access token.
#   secret - Supplied by OAuth providers, the access token secret.
#  extra - Contains extra information returned from the authentication provider. May be in provider-specific formats.
#   user_hash - A hash of all information gathered about a user in the format it was gathered. For example, for Twitter users this is a hash representing the JSON hash returned from the Twitter API.

