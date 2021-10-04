source 'https://rubygems.org'
ruby '2.5.8'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.1'
gem 'responders', '>= 2.0'
gem 'activeresource'
# Upgrade only after moving to rails 5
gem 'pg', '~>0.20.0'
# needs upgrade
gem 'json', github: 'flori/json', branch: 'v1.8'

gem 'slim-rails', github: 'slim-template/slim-rails'
gem 'active_model_serializers', '~>0.9.0'

# queues and cron-jobs
gem 'sidekiq', '~> 5.0'
gem 'pundit', github: 'elabs/pundit'
gem 'kaminari'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Code revision - update after upgrading to ruby 2.4
gem 'rubocop', '0.81', require: false
gem 'rubocop-performance', '1.5.1', require: false
gem 'rubocop-rails', require: false

group :development do
  gem 'html2slim'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard', '2.15.0'
  gem 'guard-rspec', github: 'guard/guard-rspec'
  gem 'guard-livereload', github: 'guard/guard-livereload'
  gem 'guard-rubocop', github: 'yujinakayama/guard-rubocop'
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry', '0.12.2'
  gem 'timecop', '0.9.1'
  gem 'pry-rails', '0.3.9'
  gem 'byebug', '11.0.1'
  gem 'pry-byebug', '3.7.0'
  gem 'pry-stack_explorer'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'test_after_commit'
  gem 'rspec-sidekiq'
end

