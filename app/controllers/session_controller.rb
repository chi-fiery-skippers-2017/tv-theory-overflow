get '/sessions/new' do
  if !logged_in?
    erb :'sessions/new'
  else
    redirect '/'
  end
end

post '/sessions' do
  @user = User.find_by(email: params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @message = "Incorrect Email or Password"
    erb 'sessions/new'
  end
end

delete '/sessions' do
  session.delete[:user_id]
  redirect '/'
end
