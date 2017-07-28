post '/questions/:question_id/answers/new' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @answer = @question.answers.new(params[:answer])
  @answer.author = current_user
  if @answer.save
    if request.xhr?
      # p params
      erb :'answers/_show_answer', layout: false
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    @errors = @answer.errors.full_massages
    erb :"questions/show"
  end
end
