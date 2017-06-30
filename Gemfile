source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
gem 'rails-i18n'
gem 'foreman'
gem 'devise'
gem 'devise-i18n'
gem 'bootstrap_sb_admin_base_v2'
gem 'enum_help'
gem 'pundit'
gem 'lerolero_generator'
gem 'money-rails'
gem 'paperclip'
gem 'jquery-ui-rails'
gem 'redcarpet'
gem 'friendly_id'
gem 'wiselinks'
gem 'kaminari'
gem 'kaminari-i18n'
gem 'ratyrate'

source 'https://rails-assets.org' do
  gem 'rails-assets-bootstrap', '3.3.7'
  gem 'rails-assets-bootstrap.growl'
  gem 'rails-assets-bootbox'
  gem 'rails-assets-animate-css'
  gem 'rails-assets-bootstrap-markdown'
  gem 'rails-assets-marked'
end 
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
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn' 

group :development, :test do 
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'better_errors'
  gem 'rails-erd'
  gem 'sqlite3'
end


group :production do
  # Heroku
  gem 'pg' 
  gem 'rails_12factor'
  gem 'faker'
end 

group :development do 
  gem 'mailcatcher'
  gem 'faker'
  gem 'doctor_ipsum'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0' 
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

