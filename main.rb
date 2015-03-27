require "sinatra/activerecord"
require "sinatra"
require 'json'
require "sqlite3"
require "pry"
require 'bcrypt'

set :database, {adapter: "sqlite3", database: "database/slideshow.db"}

DATABASE = SQLite3::Database.new("database/slideshow.db")

require_relative "database/database_setup.rb"
require_relative "models/slide.rb"
require_relative "models/user.rb"
require_relative "controllers/slide.rb"
require_relative "controllers/user.rb"
