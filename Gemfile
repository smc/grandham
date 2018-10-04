# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '~> 5.1'

gem 'devise'
gem 'haml-rails'
gem 'jquery-rails'
gem 'mysql2'
gem 'paperclip', '~> 4.0'
gem 'simple_form'
gem 'will_paginate', '~> 3.0'
gem 'will_paginate-bootstrap', '1.0.0'

gem 'progress_bar'
gem 'ruby-progressbar'

gem 'cancancan'
gem 'jquery-datatables-rails', '~> 3.4.0'

gem 'nprogress-rails'
gem 'turbolinks'

gem 'mini_magick'
gem 'rqrcode-rails3'

gem 'capistrano'
gem 'jbuilder'
gem 'rvm-capistrano', require: false

# Gems used only for assets and not required
# in production environments by default.
gem 'bootstrap-sass-rails'
gem 'coffee-rails'
gem 'haml'
gem 'jquery-ui-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 2.0.3'

gem 'searchkick'

group :production do
  gem 'therubyracer', platforms: :ruby
end

group :test do
  gem 'database_cleaner'
  gem 'poltergeist'
  gem 'selenium-webdriver'
  # shoulda matchers from thoughtbot for some simple specs
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end

group :development do
  gem 'better_errors'
  gem 'letter_opener'
  gem 'sextant'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'pry'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test, :development do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end
