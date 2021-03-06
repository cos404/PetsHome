source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  # https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 3.6'
  # https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails'
  # https://github.com/DatabaseCleaner/database_cleaner
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # https://github.com/capistrano/capistrano
  gem 'capistrano', '3.10.1'
  gem 'capistrano-rails', '~> 1.3'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler'
end

group :production do
  gem 'pg', '~> 0.18'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'simple_form'
gem 'bootstrap', '4.0.0'
gem 'haml-rails'
gem 'font-awesome-rails'

gem 'devise' # https://github.com/plataformatec/devise
gem 'devise-i18n'
gem 'rails-i18n', '~> 5.0.0' # https://github.com/svenfuchs/rails-i18n
gem 'i18n-js' # https://github.com/fnando/i18n-js
gem 'geocoder' # https://github.com/alexreisner/geocoder
gem 'http_accept_language' # https://github.com/iain/http_accept_language

gem 'carrierwave', '~> 1.0'
gem 'mini_magick'
gem 'jquery-fileupload-rails'
gem 'translit'
gem 'will_paginate', '~> 3.1.0'
gem "pundit"

gem 'ransack'
gem 'phony_rails' # https://github.com/joost/phony_rails

gem 'public_activity' # https://github.com/chaps-io/public_activity
