post '/questions/:question_id/answers' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @answer = @question.answers.new(params[:answer])
  @answer.author = current_user
  if @answer.save
    if request.xhr?
      erb :'answers/_full_answer', layout: false, locals: { answer: @answer }
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    status 400
    if request.xhr?
      @answer.errors.full_messages
    else
      erb :"questions/show"
    end
  end
end
