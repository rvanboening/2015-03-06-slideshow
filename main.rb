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


get '/' do
  erb :homepage
end

get '/login' do
  erb :login
end

post '/login_success' do
  params["password"] = BCrypt::Password.create(params[:password])
  new_user=User.create(user_name: params["user_name"], password: params["password"])
  binding.pry
  redirect '/'
end
  # user_name=params[:user_name]
 #  password=params[:password]
 #  user = User.new(user_name: params[:user_name], password: params[:password])
 #  binding.pry
 #  user.save
 #  redirect '/'
 #
  


get '/allslides' do
  all_slides=Slide.all # this returns an array of hashes
  all_slides.to_json
end


get '/oneslide/:id' do 
  one_slide = Slide.fetch_slide[params(:id)]
  one_slide.to_json
end
