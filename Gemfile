source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Authorization
gem 'pundit'

# Use Puma as the app server
gem 'puma'


gem 'devise'
gem 'devise_invitable'

gem 'simple_form'
gem 'font-awesome-rails'
gem 'bootstrap-sass', '~> 3.3.6'

gem 'figaro'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Static pages
gem 'high_voltage'
gem 'actionpack-page_caching'

# Admin backend
gem 'rails_admin'
gem 'paper_trail'

group :production do
  gem 'rack-timeout'
  gem 'rails_12factor'
  gem 'sentry-raven'
  gem 'newrelic_rpm'
end

group :development, :test do
  # Pry navigation commands via byebug
  gem 'byebug'
  gem 'pry-byebug'

  # Use rspec as testing framework
  gem 'rspec-rails'
end

group :development do
  # Use Thin as development webserver since it requires no config.
  # If you prefer Puma, use `foreman start` instead of `rails server`.
  gem 'thin'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Uses the local .rubocop.yml config file
  gem 'rubocop', require: false

  # Pretty print your Ruby objects with style
  gem 'awesome_print'

  # Better error page for Rack apps
  gem 'better_errors'

  # Needed for advanced features of better_errors
  gem 'binding_of_caller'

  # pry as alternative IRB shell
  gem 'pry-rails'

  # Guard
  gem 'guard'
  gem 'guard-rspec'

  # Mutes assets pipeline log messages
  gem 'quiet_assets'

  # Database
  gem 'bullet'
  gem 'lol_dba'

  # Profiling
  gem 'stackprof'
  gem 'derailed_benchmarks'

  gem 'mailcatcher'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'capybara-email'
  gem 'simplecov', require: false
  gem 'codeclimate-test-reporter', require: false
  gem 'faker'
  gem 'webmock'
  gem 'bundler-audit', require: false
  # Factory Girl as a replacement for fixtures
  gem 'factory_girl_rails'
end
