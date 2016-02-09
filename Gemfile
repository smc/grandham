source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'mysql2'
gem 'devise'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap', '1.0.0'
gem 'simple_form'
gem 'jquery-rails'
gem 'haml-rails'
gem "paperclip", "~> 3.0"

gem 'ruby-progressbar'
gem 'progress_bar'

gem 'sunspot_rails'
gem 'sunspot_solr'
gem 'jquery-datatables-rails', git: 'git://github.com/rweng/jquery-datatables-rails.git'
gem "cancan"

gem 'turbolinks'
gem 'nprogress-rails'

gem 'rqrcode-rails3'
gem 'mini_magick'

gem 'jbuilder'
gem 'capistrano'
gem 'rvm-capistrano'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'haml'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'jquery-ui-rails'
  gem 'bootstrap-sass-rails'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'therubyracer', :platforms => :ruby
end

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'poltergeist'
  # shoulda matchers from thoughtbot for some simple specs
  gem 'shoulda-matchers'
end

group :development do
  gem 'sextant'
  gem 'better_errors'
  gem "letter_opener"
end

group :test, :development do
  gem 'rspec-rails'
  gem "factory_girl_rails", "~> 4.0"
end