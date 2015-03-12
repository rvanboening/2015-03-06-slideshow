
get '/login' do
  erb :login
end

post '/login_success' do
  params["password"] = BCrypt::Password.create(params[:password])
  new_user=User.create(user_name: params["user_name"], password: params["password"])
  binding.pry
  redirect '/'
end

get '/logout' do
  
  redirect '/login'
end

get '/newuser' do

  erb :newuser
end

post '/newuser_confirm' do
  x=params["email"]
  params["password"] = BCrypt::Password.create(params[:password])
  new_user=User.create({user_name: params["user_name"], password: params["password"], email: params["email"]})
  redirect '/'
end