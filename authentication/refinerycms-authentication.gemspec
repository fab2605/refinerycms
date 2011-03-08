# DO NOT EDIT THIS FILE DIRECTLY! Instead, use lib/gemspec.rb to generate it.

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-authentication}
  s.version           = %q{0.9.9.4}
  s.summary           = %q{Authentication engine for Refinery CMS}
  s.description       = %q{The default authentication engine for Refinery CMS}
  s.date              = %q{2011-03-06}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.rubyforge_project = %q{refinerycms}
  s.authors           = ['Resolve Digital', 'Philip Arndt', 'David Jones', 'Steven Heidel']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.executables       = %w()

  s.add_dependency 'refinerycms-core', '~> 0.9.9.4'
  s.add_dependency 'devise',           '~> 1.2.rc'
  s.add_dependency 'omniauth',         '>= 0.2.0.beta3'
  s.add_dependency 'oa-oauth'

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/administrators_controller.rb',
    'app/controllers/admin/confirmables_controller.rb',
    'app/controllers/admin/lockables_controller.rb',
    'app/controllers/admin/recoverables_controller.rb',
    'app/controllers/admin/rememberables_controller.rb',
    'app/controllers/admin/token_authentications_controller.rb',
    'app/controllers/admin/users_controller.rb',
    'app/controllers/administrator_passwords_controller.rb',
    'app/controllers/administrator_registrations_controller.rb',
    'app/controllers/administrator_sessions_controller.rb',
    'app/controllers/users',
    'app/controllers/users/omniauth_callbacks_controller.rb',
    'app/helpers',
    'app/helpers/administrators_helper.rb',
    'app/helpers/sessions_helper.rb',
    'app/helpers/users_helper.rb',
    'app/mailers',
    'app/mailers/administrator_mailer.rb',
    'app/models',
    'app/models/actor.rb',
    'app/models/actor_plugin.rb',
    'app/models/administrator.rb',
    'app/models/role.rb',
    'app/models/user.rb',
    'app/models/user_token.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/administrators',
    'app/views/admin/administrators/_administrator.html.erb',
    'app/views/admin/administrators/_administrators.html.erb',
    'app/views/admin/administrators/_form.html.erb',
    'app/views/admin/administrators/edit.html.erb',
    'app/views/admin/administrators/index.html.erb',
    'app/views/admin/administrators/new.html.erb',
    'app/views/admin/administrators/show.html.haml',
    'app/views/admin/users',
    'app/views/admin/users/_form.html.erb',
    'app/views/admin/users/_user.html.erb',
    'app/views/admin/users/_users.html.erb',
    'app/views/admin/users/edit.html.erb',
    'app/views/admin/users/index.html.erb',
    'app/views/admin/users/new.html.erb',
    'app/views/admin/users/show.html.haml',
    'app/views/administrator_mailer',
    'app/views/administrator_mailer/reset_notification.html.erb',
    'app/views/administrator_mailer/reset_notification.text.plain.erb',
    'app/views/administrator_passwords',
    'app/views/administrator_passwords/edit.html.erb',
    'app/views/administrator_passwords/new.html.erb',
    'app/views/administrator_registrations',
    'app/views/administrator_registrations/new.html.erb',
    'app/views/administrator_sessions',
    'app/views/administrator_sessions/new.html.erb',
    'app/views/layouts',
    'app/views/layouts/login.html.erb',
    'app/views/shared',
    'app/views/shared/admin',
    'app/views/shared/admin/_confirmable.html.haml',
    'app/views/shared/admin/_database_authenticatable.html.haml',
    'app/views/shared/admin/_encryptable.html.haml',
    'app/views/shared/admin/_lockable.html.haml',
    'app/views/shared/admin/_omniauthable.html.haml',
    'app/views/shared/admin/_recoverable.html.haml',
    'app/views/shared/admin/_registerable.html.haml',
    'app/views/shared/admin/_rememberable.html.haml',
    'app/views/shared/admin/_timeoutable.html.haml',
    'app/views/shared/admin/_token_authenticatable.html.haml',
    'app/views/shared/admin/_trackable.html.haml',
    'app/views/shared/admin/_validatable.html.haml',
    'app/views/users',
    'app/views/users/confirmations',
    'app/views/users/confirmations/new.html.haml',
    'app/views/users/mailer',
    'app/views/users/mailer/confirmation_instructions.html.haml',
    'app/views/users/mailer/reset_password_instructions.html.haml',
    'app/views/users/mailer/unlock_instructions.html.haml',
    'app/views/users/passwords',
    'app/views/users/passwords/edit.html.haml',
    'app/views/users/passwords/new.html.haml',
    'app/views/users/registrations',
    'app/views/users/registrations/edit.html.haml',
    'app/views/users/registrations/new.html.haml',
    'app/views/users/sessions',
    'app/views/users/sessions/new.html.haml',
    'app/views/users/shared',
    'app/views/users/shared/_links.haml',
    'app/views/users/unlocks',
    'app/views/users/unlocks/new.html.haml',
    'config',
    'config/locales',
    'config/locales/cs.yml',
    'config/locales/da.yml',
    'config/locales/de.yml',
    'config/locales/el.yml',
    'config/locales/en.yml',
    'config/locales/es.yml',
    'config/locales/fr.yml',
    'config/locales/it.yml',
    'config/locales/lolcat.yml',
    'config/locales/lt.yml',
    'config/locales/lv.yml',
    'config/locales/nb.yml',
    'config/locales/nl.yml',
    'config/locales/pl.yml',
    'config/locales/pt-BR.yml',
    'config/locales/rs.yml',
    'config/locales/ru.yml',
    'config/locales/sl.yml',
    'config/locales/sv.yml',
    'config/locales/vi.yml',
    'config/locales/zh-CN.yml',
    'config/locales/zh-TW.yml',
    'config/routes.rb',
    'db',
    'db/seeds',
    'db/seeds/first_admin.rb',
    'features',
    'features/administrator.feature',
    'features/lost_password.feature',
    'features/manage_administrators.feature',
    'features/manage_users.feature',
    'features/step_definitions',
    'features/step_definitions/authentication_steps.rb',
    'features/support',
    'features/support/factories.rb',
    'features/support/paths.rb',
    'features/user.feature',
    'lib',
    'lib/authenticated_system.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_authentication_generator.rb',
    'lib/refinerycms-authentication.rb',
    'license.md',
    'refinerycms-authentication.gemspec',
    'spec',
    'spec/controllers',
    'spec/controllers/users',
    'spec/controllers/users/omniauth_callbacks_controller_spec.rb',
    'spec/models',
    'spec/models/administrator_spec.rb',
    'spec/models/user_spec.rb'
  ]
end
