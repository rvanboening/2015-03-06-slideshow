require "sinatra"
require 'json'
require "sqlite3"
require "pry"

DATABASE = SQLite3::Database.new("slideshow.db")
require_relative "database_setup.rb"
require_relative "models/slide.rb"


get '/' do
  
  erb :homepage
end

get '/allslides' do
  all_slides=Slide.fetch_all # this returns an array of hashes
  all_slides.to_json
end

get '/oneslide/:id' do 
  one_slide = Slide.fetch_slide[params(:id)]
  binding.pry
  one_slide.to_json
end