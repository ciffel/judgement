source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'devise'
gem 'devise-async'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails'
gem 'bootstrap_helper'
gem "font-awesome-rails"
gem 'simple_form', '~> 3.0rc'
gem 'enumerize'
gem 'redcarpet'
gem 'coderay'
gem 'settingslogic'
gem "resque", "~> 2.0.0.pre.1", github: "resque/resque"
gem 'will_paginate'
gem 'will_paginate-bootstrap'

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'capistrano', :require => false
  gem 'capistrano-unicorn', :require => false
  gem "capistrano-resque", "~> 0.1.0", :require => false
end

group :production do
  gem 'pg'
  gem 'unicorn'
  gem 'dalli'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
