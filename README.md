# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 5.2.0

* System dependencies

* Configuration
    rails new sampleapp --api -T --database=postgresql

    change aplication_controller

    class ApplicationController < ActionController::API
     #--> old
    end

    class ApplicationController < ActionController::Base
     #--> new
    end

u need change config/aplication.rb

    #require "sprockets/railtie"

    to -->

     require "sprockets/railtie"

add add after config.api_only = true

    config.middleware.use Rack::MethodOverride
    config.middleware.use ActionDispatch::Flash
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

now, add gem 'devise' gem 'acitiveadmin' and run bundle install

install this activeadmin with rails/rake generate active_admin:install

    need migration database admin run, rake db:migrate && rake db:seed

for login u can see on db/seeds.rb

for add resource model run, rails/rake g active_admin:resource yourmodel

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
