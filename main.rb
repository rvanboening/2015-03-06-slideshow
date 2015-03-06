require "sinatra"
require 'json'
require "sqlite3"
require "pry"

DATABASE = SQLite3::Database.new("slideshow.db")

require_relative "models/slide.rb"


get "/" do
  erb :homepage
end


get "/nextslide" do

end


get"/lastslide" do
  
end