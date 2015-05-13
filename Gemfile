source 'https://rubygems.org'
ruby '2.2.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'mongoid', '~> 4.0.0'
gem 'bson_ext'
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Devise authentication system
gem 'devise'
# Graphing
gem 'highcharts-rails'
# gem for require and autoloading files
gem 'require_all', '~> 1.3.2'
# paginate
gem 'kaminari'
# date select
gem 'compass', '~> 1.0.3'
gem 'bootstrap-datepicker', '~> 1.2.0'
gem 'bootstrap-datepicker-rails'
gem 'font-awesome-rails'
gem 'simple-line-icons-rails', '~> 0.0.1'
gem 'rails_12factor', group: :production

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
  #gem 'pry', '~> 0.10.1'
  # provides a binding.pry method for debugging
  gem 'pry-rails', '~> 0.3.4'
  # makes it possible to use next to move to next line of code
  gem 'pry-nav', '~> 0.2.4'
  # allows use of up and down methods to move to next method in the stack, show all track with show-stack method
  gem 'pry-stack_explorer', '~> 0.4.9.2'
  gem 'mongoid-rspec', '~> 2.2.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'faker', '~> 1.4.3'
  gem 'selenium-webdriver'

  gem 'spring-commands-rspec'
  gem 'guard-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'tmuxinator'
end

group :test do 
	gem 'shoulda', '~> 3.5.0'

	gem 'capybara', '~> 2.4.4'

  gem 'launchy', '~> 2.4.3'

  gem 'database_cleaner', '~> 1.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin]
