# frozen_string_literal: true

source 'https://rubygems.org'

# Specify your gem's dependencies in cortex.gemspec
gemspec

group :test, :development do
  gem 'rake', '~> 13.0'
  gem 'rspec', '~> 3.0'
  gem 'rubocop', '~> 1.21'
end

group :development do
  gem 'yard', '~> 0.9', require: false
end

group :test do
  gem 'simplecov', '~> 0.22', require: false
  gem 'vcr', '~> 6.3', require: false
  gem 'webmock', '~> 3.24', require: false
end
