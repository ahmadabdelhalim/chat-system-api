source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'rack-cors'
gem 'active_model_serializers'
gem 'sidekiq'
gem 'sinatra'
gem 'searchkick'
gem 'oj'
gem 'typhoeus'
gem 'redis-rails'

group :development, :test do
  gem 'rspec-rails', '~> 3.8.0'
  gem 'factory_bot_rails', '~> 4.10.0'
  gem 'faker'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
