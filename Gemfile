# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '~> 7.0.8'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.2'
gem 'devise'
gem 'haml-rails', '~> 2.0'
gem 'importmap-rails'
gem 'kaminari'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'sassc-rails'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'faker'
  gem 'gimei'
  gem 'rails-i18n'
  gem 'sgcop', github: 'SonicGarden/sgcop'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
