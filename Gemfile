source 'https://rubygems.org'
ruby '2.2.3'
gem 'rake', '11.1.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
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
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'pg'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'zh-lorem', '~> 1.0'
gem 'mini_magick'
gem 'fog-aws', '<= 0.1.1'
gem 'carrierwave', github:'carrierwaveuploader/carrierwave'
gem 'figaro'
gem 'ransack'
gem 'awesome_rails_console'
gem 'browser'
gem 'devise'
gem 'omniauth', '1.2.2'
gem 'omniauth-facebook', '3.0.0'
gem 'bundler', '1.11.2'
gem 'jquery-ui-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.10'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
end

gem 'puma'
group :development do
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

group :production do
  gem "rack-timeout"
  gem 'rails_12factor'
  #gem 'puma'
end