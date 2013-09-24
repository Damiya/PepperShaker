source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'
gem 'pg' # DB
gem 'unicorn'

gem 'mechanize'
gem 'squeel'
gem 'sidekiq'
gem 'unicorn-rails'
gem 'google-analytics-rails'
gem 'apipie-rails'
gem 'maruku'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'

group :assets do
  gem 'sass-rails', '~> 4.0.0' # if running rails 3.1 or greater
  gem 'compass-rails'
end

gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'ember-data-source', '1.0.0.beta2'
gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'

gem 'ember-rails'

gem 'ember-auth-rails'

gem 'ember-auth-source', '~> 8.0.1'

gem 'dotenv-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# Because winblowze, have to use the github repo
gem 'bcrypt-ruby'

gem 'devise' # server-side authentication

gem 'inherited_resources' # for easy RESTful API controller scaffolding
gem 'active_model_serializers' # works out of the box with ember-data

group :development do
  gem 'rvm-capistrano'
  gem 'capistrano'
end
