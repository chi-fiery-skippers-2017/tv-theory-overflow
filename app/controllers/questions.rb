get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/users/:user_id/questions/new' do
  authenticate!
  @user = current_user
  erb :"questions/new"
end

post '/users/:user_id/questions' do
  authenticate!
  redirect '/404' unless current_user.id == params[:user_id].to_i

  @user = current_user
  @question = @user.questions.new(params[:question])
  if @question.save
    redirect "/questions"
  else
    @errors = @question.errors.full_messages
    erb :"questions/new"
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :"questions/show"
end

post 'questions/:id/best_answer' do
  
  if request.xhr?
    "DSDSDV"
  else

  end
end
