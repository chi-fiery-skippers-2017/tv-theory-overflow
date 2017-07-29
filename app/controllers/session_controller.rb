get '/sessions/new' do
  if !logged_in?
    erb :'sessions/new'
  else
    redirect '/'
  end
end

post '/sessions' do
  @user = User.find_by(username: params[:user][:username])

  if @user && @user.verify_password(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "Incorrect Username or Password"
    erb :'sessions/new'
  end
end

delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end
