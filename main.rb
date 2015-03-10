require "sinatra/activerecord"
require "sinatra"
require 'json'
require "sqlite3"
require "pry"

set :database, {adapter: "sqlite3", database: "database/slideshow.db"}
# DATABASE = SQLite3::Database.new("slideshow.db")
require_relative "database/database_setup.rb"
require_relative "models/slide.rb"


get '/' do
  
  erb :homepage
end

get '/allslides' do
  all_slides=Slide.all # this returns an array of hashes
  all_slides.to_json
end

get '/oneslide/:id' do 
  one_slide = Slide.fetch_slide[params(:id)]
  one_slide.to_json
end