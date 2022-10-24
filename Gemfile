source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false # Reduces boot times through caching; required in config/boot.rb
gem "devise" # User authentication
gem "importmap-rails" # Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "rails", "~> 7.0.3", ">= 7.0.3.1" # Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "redis", "~> 4.0" # Use Redis adapter to run Action Cable in production
gem "sassc-rails" # Use Sass to process CSS
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails" # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :test do
  gem "shoulda-matchers", "~> 5.0" # Assert model validations
end

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ] # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "factory_bot_rails" # Fixture to instantiate classes for testing
  gem "faker", git: 'https://github.com/faker-ruby/faker.git', branch: "master" # Dummy values for testing/development
  gem "faker-jp_prefecture" #Dummy values relating to Japanese prefectures
  gem 'pry-byebug' # Debugging breakpoints
  gem "rspec-rails", "~> 5.1", ">= 5.1.2" # Testing framework
end

group :development do
  gem "web-console" # Use console on exceptions pages [https://github.com/rails/web-console]
  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

