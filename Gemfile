source 'https://rubygems.org'
ruby "2.2.0"
gem 'rails', '4.2.0'

# database
gem 'pg'

# assets
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'rails_12factor', group: :production

# tools
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
gem 'will_paginate', '~> 3.0'
gem 'acts-as-taggable-on', '~> 3.4'

# server
gem 'unicorn'

# auth
gem 'devise', github: 'plataformatec/devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem "cancancan"

# upload
gem 'carrierwave'
gem "rmagick", "2.13.2", :require => 'RMagick'
gem "fog", "~> 1.28.0"

group :development do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
end

# Tests / Debugging
group :development, :test do
  gem 'brakeman', :require => false
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'database_cleaner'
  gem 'steak'
  gem 'rspec-rails'
  gem 'mocha',  :require => false
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'simplecov', :require => false
end

