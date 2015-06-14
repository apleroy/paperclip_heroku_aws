source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

gem 'jquery-turbolinks' #https://github.com/kossnocorp/jquery.turbolinks



# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails', '2.13.1' #http://stackoverflow.com/questions/22962048/rails-4-could-not-find-generator-rspecinstall
  gem 'selenium-webdriver', "~> 2.43"
  gem 'capybara'
  gem 'spork-rails'
  gem 'childprocess'
  gem "chromedriver-helper" #use chrome with selenium
  gem "database_cleaner"
  gem 'minitest' #needed for rspec support
end

gem 'puma'


gem "paperclip", "~> 4.2" #https://github.com/thoughtbot/paperclip

#http://stackoverflow.com/questions/28374401/nameerror-uninitialized-constant-paperclipstorages3aws
gem 'aws-sdk', '< 2.0' #https://devcenter.heroku.com/articles/paperclip-s3

gem 'friendly_id', '~> 5.1.0'

#HEROKU
#https://devcenter.heroku.com/articles/getting-started-with-rails4#heroku_gems

gem 'rails_12factor', group: :production
ruby "2.0.0"


