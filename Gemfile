# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.7.0'
gem 'rails', '~> 6.0'

gem 'aws-sdk'
gem 'aws-sdk-s3'
gem 'bootstrap_sb_admin_base_v2'
gem 'coffee-rails'
gem 'devise', '>= 4.7.1'
gem 'devise-i18n'
gem 'doctor_ipsum'
gem 'enum_help'
gem 'faker'
gem 'foreman'
gem 'friendly_id'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'kaminari', '>= 1.2.1'
gem 'kaminari-i18n'
gem 'lerolero_generator'
gem 'money-rails'
gem 'paperclip'
gem 'pundit'
gem 'rails-i18n'
gem 'ratyrate'
gem 'redcarpet'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'uglifier', '>= 1.3.0'

source 'https://rails-assets.org' do
  gem 'rails-assets-animate-css'
  gem 'rails-assets-bootbox'
  gem 'rails-assets-bootstrap', '3.3.7'
  gem 'rails-assets-bootstrap-markdown'
  gem 'rails-assets-bootstrap.growl'
  gem 'rails-assets-marked'
end

group :development, :test do
  gem 'better_errors'
  gem 'byebug'
  gem 'rails-erd'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'sqlite3', '~> 1.3', '>= 1.3.6'
end

group :production do
  # Heroku
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'spring'
end
