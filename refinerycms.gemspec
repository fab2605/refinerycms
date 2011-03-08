# DO NOT EDIT THIS FILE DIRECTLY! Instead, use lib/gemspec.rb to generate it.

Gem::Specification.new do |s|
  s.name              = %q{refinerycms}
  s.version           = %q{0.9.9.4}
  s.description       = %q{A Ruby on Rails CMS that supports Rails 3. It's easy to extend and sticks to 'the Rails way' where possible.}
  s.date              = %q{2011-03-05}
  s.summary           = %q{A Ruby on Rails CMS that supports Rails 3}
  s.email             = %q{info@refinerycms.com}
  s.homepage          = %q{http://refinerycms.com}
  s.rubyforge_project = %q{refinerycms}
  s.authors           = ['Resolve Digital', 'Philip Arndt', 'David Jones', 'Steven Heidel']
  s.license           = %q{MIT}
  s.require_paths     = %w(lib)
  s.executables       = %w(refinerycms)

  # Bundler
  s.add_dependency    'bundler',                    '~> 1.0.10'

  # Refinery CMS
  s.add_dependency    'refinerycms-authentication', '~> 0.9.9.4'
  s.add_dependency    'refinerycms-base',           '~> 0.9.9.4'
  s.add_dependency    'refinerycms-core',           '~> 0.9.9.4'
  s.add_dependency    'refinerycms-dashboard',      '~> 0.9.9.4'
  s.add_dependency    'refinerycms-images',         '~> 0.9.9.4'
  s.add_dependency    'refinerycms-pages',          '~> 0.9.9.4'
  s.add_dependency    'refinerycms-resources',      '~> 0.9.9.4'
  s.add_dependency    'refinerycms-settings',       '~> 0.9.9.4'

  s.files             = [
    '.gitignore',
    '.rspec',
    '.yardopts',
    'Gemfile',
    'Gemfile',
    'Gemfile.lock',
    'Rakefile',
    'app',
    'app/views',
    'app/views/sitemap',
    'app/views/sitemap/index.xml.builder',
    'autotest',
    'autotest/autotest.rb',
    'autotest/discover.rb',
    'bin',
    'bin/refinerycms',
    'changelog.md',
    'changelog.md',
    'config',
    'config/app',
    'config/app/development.rb',
    'config/app/production.rb',
    'config/app/test.rb',
    'config/app.rb',
    'config/app.rb.sample',
    'config/cucumber.yml',
    'config/environments',
    'config/environments/development.rb',
    'config/environments/production.rb',
    'config/environments/test.rb',
    'config/mongoid.yml',
    'config/mongoid.yml.sample',
    'config/routes.rb',
    'config/settings.rb',
    'config.ru',
    'index',
    'index/cucumber',
    'index/cucumber/RefinerySetting',
    'index/cucumber/RefinerySetting/117_115_101',
    'index/cucumber/RefinerySetting/size',
    'index/development',
    'index/development/RefinerySetting',
    'index/development/RefinerySetting/100_114_97',
    'index/development/RefinerySetting/105_49_56',
    'index/development/RefinerySetting/117_115_101',
    'index/development/RefinerySetting/97_112_112',
    'index/development/RefinerySetting/size',
    'index/test',
    'index/test/RefinerySetting',
    'index/test/RefinerySetting/100_101_102',
    'index/test/RefinerySetting/100_114_97',
    'index/test/RefinerySetting/102_114_111',
    'index/test/RefinerySetting/105_109_97',
    'index/test/RefinerySetting/105_49_56',
    'index/test/RefinerySetting/110_101_119',
    'index/test/RefinerySetting/112_114_101',
    'index/test/RefinerySetting/112_97_103',
    'index/test/RefinerySetting/115_105_116',
    'index/test/RefinerySetting/116_101_115',
    'index/test/RefinerySetting/116_108_100',
    'index/test/RefinerySetting/117_115_101',
    'index/test/RefinerySetting/97_112_112',
    'index/test/RefinerySetting/97_117_116',
    'index/test/RefinerySetting/97_99_116',
    'index/test/RefinerySetting/size',
    'lib',
    'lib/refinery.rb',
    'lib/refinerycms.rb',
    'license.md',
    'license.md',
    'public',
    'readme.md',
    'readme.md',
    'refinerycms.gemspec',
    'spec',
    'spec/rcov.opts',
    'spec/spec_helper.rb'
  ]
end
