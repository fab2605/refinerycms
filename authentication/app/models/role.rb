class Role
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :user_ids, :type => Array

  #references_and_referenced_in_many :users, :inverse_of => :roles #, :stored_as => :array, :inverse_of => :roles

  before_validation :camelize_title
  validates :title, :uniqueness => true

  # Extractable Methods

  def self.table_exists?
    included_modules.include? Mongoid::Document
  end

  def self.column_names
    fields
  end

  def self.find_or_create_by_title(title)
    find_or_create_by(:title => title)
  end

  def self.find_by_title(title)
    where(:title => title).first
  end

  def camelize_title(role_title = self.title)
    self.title = role_title.to_s.camelize
  end

  def self.[](title)
    find_or_create_by_title(title.to_s.camelize)
  end

  # Temporary Workaround
  def users
    a = []
    User.where(:_id => { "$in" => self.user_ids }).each do |user|
      a << user
    end
    a
  end
end

