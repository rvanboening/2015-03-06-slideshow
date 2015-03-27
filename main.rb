require 'rubygems'
require 'bundler/setup'
require 'nokogiri'
require "sinatra/activerecord"
require "sinatra"
require 'json'
require "sqlite3"
require "pry"
require 'bcrypt'

configure :development do
set :database, {adapter: "sqlite3", database: "database/slideshow.db"}
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'])
 ActiveRecord::Base.establish_connection(
 :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
 :host => db.host,
 :username => db.user,
 :password => db.password,
 :database => db.path[1..-1],
 :encoding => 'utf8'
 )
end

DATABASE = SQLite3::Database.new("database/slideshow.db")

require_relative "database/database_setup.rb"
require_relative "models/slide.rb"
require_relative "models/user.rb"
require_relative "controllers/slide.rb"
require_relative "controllers/user.rb"


# require your gems as usual
