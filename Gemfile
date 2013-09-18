source 'https://rubygems.org'

ruby '1.9.3'

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end

gem 'sidekiq'

gem 'thin'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

gem 'pg'

gem 'rails-api'

gem 'squeel'

group :assets do
  gem 'sass-rails', '~> 4.0.0' # if running rails 3.1 or greater
  gem 'compass-rails'
end

gem 'mechanize'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

gem 'ember-data-source', '1.0.0.beta2'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'bootstrap-sass', :git => 'git://github.com/thomas-mcdonald/bootstrap-sass.git', :branch => '3'

gem 'dotenv-rails'

gem 'ember-rails'

gem 'ember-auth-rails'

gem 'ember-auth-source', '~> 8.0.1'

gem 'foreman'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

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
gem 'bcrypt-ruby', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'

gem 'devise' # server-side authentication

gem 'inherited_resources' # for easy RESTful API controller scaffolding
gem 'active_model_serializers' # works out of the box with ember-data

group :development do
  gem 'rvm-capistrano'
  gem 'capistrano'
end