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
  
  user_name=params[:user_name]
  password=params[:password]
  user = BCrypt::Password.create(user_name: params[:user_name], password: params[:password])
  binding.pry
  user.save
  redirect '/'
 
  # if user = User.find_by({user_name => "user_name"})
#     if BCrypt::Password.create(params[:password]) == params[:password]
#       session[:id] = user.id
#       redirect "/"
#       binding.pry
#     else
#       @error = "Password incorrect"
#     end
#   else
#     params["password"] = BCrypt::Password.create(params[:password])
#     User.create(username: params["username"], password: params["password"])
#   end
#   redirect "/"
  
  
  
  
end

get '/allslides' do
  all_slides=Slide.all # this returns an array of hashes
  all_slides.to_json
end


get '/oneslide/:id' do 
  one_slide = Slide.fetch_slide[params(:id)]
  one_slide.to_json
end
