source 'https://rubygems.org'

ruby '1.9.3'

group :core do
  gem 'rails', '4.0.0'
  gem 'rails-api'
  gem 'thin' # HTTPd
  gem 'pg' # DB
end

group :development do
  gem 'therubyracer'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

group :api do
  gem 'inherited_resources' # for easy RESTful API controller scaffolding
  gem 'jbuilder', '~> 1.2'
  gem 'active_model_serializers' # works out of the box with ember-data
end

gem 'mechanize' # Web agent for scraping

gem 'squeel' # Used to simplify a few queries

gem 'sidekiq' # Worker manager

gem 'dotenv-rails'

# Using the git repo because of Windows issues with ruby 2.0. Prob not needed now
gem 'bcrypt-ruby', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
gem 'devise' # server-side authentication

group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'google-analytics-rails'
  gem 'compass-rails'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'ember-data-source', '1.0.0.beta2'
  gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'
  gem 'jquery-rails'
  gem 'ember-rails'
  gem 'ember-auth-rails'
  gem 'ember-auth-source', '~> 8.0.1'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development do
  gem 'rvm-capistrano'
  gem 'capistrano'
end