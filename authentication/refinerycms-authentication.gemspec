# DO NOT EDIT THIS FILE DIRECTLY! Instead, use lib/gemspec.rb to generate it.

Gem::Specification.new do |s|
  s.name              = %q{refinerycms-authentication}
  s.version           = %q{0.9.9.8}
  s.summary           = %q{Authentication engine for Refinery CMS}
  s.description       = %q{The default authentication engine for Refinery CMS}
  s.date              = %q{2011-03-11}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.rubyforge_project = %q{refinerycms}
  s.authors           = ['Resolve Digital', 'Philip Arndt', 'David Jones', 'Steven Heidel']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.executables       = %w()

  s.add_dependency 'refinerycms-core', '~> 0.9.9.8'
  s.add_dependency 'devise',           '~> 1.1'

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/users_controller.rb',
    'app/controllers/passwords_controller.rb',
    'app/controllers/registrations_controller.rb',
    'app/controllers/sessions_controller.rb',
    'app/helpers',
    'app/helpers/sessions_helper.rb',
    'app/helpers/users_helper.rb',
    'app/mailers',
    'app/mailers/user_mailer.rb',
    'app/models',
    'app/models/role.rb',
    'app/models/roles_users.rb',
    'app/models/user.rb',
    'app/models/user_plugin.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/users',
    'app/views/admin/users/_actions.html.erb',
    'app/views/admin/users/_form.html.erb',
    'app/views/admin/users/_records.html.erb',
    'app/views/admin/users/_user.html.erb',
    'app/views/admin/users/_users.html.erb',
    'app/views/admin/users/edit.html.erb',
    'app/views/admin/users/index.html.erb',
    'app/views/admin/users/new.html.erb',
    'app/views/layouts',
    'app/views/layouts/login.html.erb',
    'app/views/passwords',
    'app/views/passwords/edit.html.erb',
    'app/views/passwords/new.html.erb',
    'app/views/registrations',
    'app/views/registrations/new.html.erb',
    'app/views/sessions',
    'app/views/sessions/new.html.erb',
    'app/views/user_mailer',
    'app/views/user_mailer/reset_notification.html.erb',
    'app/views/user_mailer/reset_notification.text.plain.erb',
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
    'config/locales/sk.yml',
    'config/locales/sl.yml',
    'config/locales/sv.yml',
    'config/locales/vi.yml',
    'config/locales/zh-CN.yml',
    'config/locales/zh-TW.yml',
    'config/routes.rb',
    'db',
    'db/migrate',
    'db/migrate/20100913234705_create_refinerycms_authentication_schema.rb',
    'db/migrate/20100929035252_add_missing_indexes_to_roles_users.rb',
    'db/migrate/20101206013505_change_to_devise_users_table.rb',
    'db/migrate/20110106184757_add_remember_created_at_to_users.rb',
    'features',
    'features/lost_password.feature',
    'features/manage_users.feature',
    'features/step_definitions',
    'features/step_definitions/lost_password.rb',
    'features/step_definitions/user_steps.rb',
    'features/support',
    'features/support/factories.rb',
    'features/support/paths.rb',
    'lib',
    'lib/authenticated_system.rb',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_authentication_generator.rb',
    'lib/refinerycms-authentication.rb',
    'license.md',
    'refinerycms-authentication.gemspec',
    'spec',
    'spec/models',
    'spec/models/user_spec.rb'
  ]
end
