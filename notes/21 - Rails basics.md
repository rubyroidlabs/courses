# Rails basics

###What is Rails?
Rails is a web application development framework written in the Ruby language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. 

The Rails philosophy includes two major guiding principles:

Don't Repeat Yourself: DRY is a principle of software development which states that "Every piece of knowledge must have a single, unambiguous, authoritative representation within a system." By not writing the same information over and over again, our code is more maintainable, more extensible, and less buggy.
Convention Over Configuration: Rails has opinions about the best way to do many things in a web application, and defaults to this set of conventions, rather than require that you specify every minutiae through endless configuration files.


### Installing rails
```
$ gem install rails
$ rails --version
$ rails new my_app
```

### Files

Describe each folder and it's content

### Run server

```
rails s
```

### Scaffolding

```
rails generate controller welcome index
rails g model User
rails g migration Name field:type
rails g scaffold
```

### Routes

Take care of `root` path

```
root 'welcome#index'
```

# Useful gems

```
gem 'nokogiri'

gem 'cancancan'
gem 'capistrano'
gem 'coffee-rails', '~> 4.0.0'
gem 'font-awesome-rails'
gem 'httparty'
gem 'i18n-js'
gem 'oauth2'
gem 'paperclip'
gem 'pdfkit'
gem 'pg'
gem 'rabl'
gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0.1'
gem 'sidekiq'
gem 'slim'
gem 'sorcery'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'
gem 'whenever', :require => false
gem 'paranoia', '~> 2.0'


group :test do
  gem 'vcr'
  gem 'webmock'
end

group :development, :test do
  gem 'rspec'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'proxylocal'
  gem 'quiet_assets'
end
```