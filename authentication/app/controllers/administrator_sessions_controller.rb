class AdministratorSessionsController < ::Devise::SessionsController
  layout 'login'

  before_filter :clear_unauthenticated_flash, :only => [:new]

  def create
    super
  rescue BCrypt::Errors::InvalidSalt, ::BCrypt::Errors::InvalidHash
    flash[:error] = t('password_encryption', :scope => 'administrators.forgot')
    redirect_to new_administrator_password_path
  end

protected
  # We don't like this alert.
  def clear_unauthenticated_flash
    if flash.keys.include?(:alert) and flash.values.any?{|v|
      ['unauthenticated', t('unauthenticated', :scope => 'devise.failure')].include?(v)
    }
      flash.delete(:alert)
    end
  end

end
