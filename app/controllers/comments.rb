get '/questions/:question_id/comments/new' do
  @question = Question.find_by(id: params[:question_id])
  @post_route = "/questions/#{@question.id}/comments"
  if request.xhr?
    if logged_in?
      erb :"comments/_new_form", layout: false
    else
      "You have to be logged in to do that"
    end
  else
    puts "nope"
  end
end

post '/questions/:question_id/comments' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @comment = @question.comments.new(params[:comment])
  @comment.author = current_user

  if @comment.save
    @post_vote_route = "/comments/#{@comment.id}/votes"
    if request.xhr?
      erb :"comments/_show", layout: false, locals: { comment: @comment }
    else
      status 400
      "error"
    end
  else
    status 400
    redirect '/404'
  end
end

get '/answers/:answer_id/comments/new' do
  @answer = Answer.find_by(id: params[:answer_id])
  @post_route = "/answers/#{@answer.id}/comments"
  if request.xhr?
    if logged_in?
      erb :"comments/_new_form", layout: false
    else
      "You have to be logged in to do that"
    end
  else
    puts "nope"
  end
end

post '/answers/:answer_id/comments' do
  authenticate!
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = @answer.comments.new(params[:comment])
  @comment.author = current_user

  if @comment.save
    @post_vote_route = "/comments/#{@comment.id}/votes"
    if request.xhr?
      erb :"comments/_show", layout: false, locals: { comment: @comment }
    else
      status 400
      "error"
    end
  else
    status 400
    redirect '/404'
  end
end
