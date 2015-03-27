enable :sessions

get '/' do
  erb :login
end

post '/login_success' do
    if User.find_by_user_name(params[:user_name]) != nil
      user = User.find_by_user_name(params[:user_name])
      if BCrypt::Password.new(user.password) == params[:password]
        session[:user_name] = user.user_name
        
        redirect '/slides'
      else
        redirect '/'
      end
    else
      redirect '/'
    end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/newuser' do
  erb :newuser
end

post '/newuser_confirm' do
  x=params["email"]
  params["password"] = BCrypt::Password.create(params[:password])
  new_user=User.create({user_name: params["user_name"], password: params["password"], email: params["email"]})
  session[:user_name] = new_user.user_name
  redirect '/slides'
end