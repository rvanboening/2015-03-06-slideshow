
get '/login' do
  erb :login
end

post '/login_success' do
    if User.find_by_user_name(params[:user_name]) != nil
      user = User.find_by_user_name(params[:user_name])
      if BCrypt::Password.new(user.password) == params[:password]
        session[:user] = user.user_name
        redirect '/'
      else 
        redirect '/login'
      end
    else 
      redirect '/login'
    end
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