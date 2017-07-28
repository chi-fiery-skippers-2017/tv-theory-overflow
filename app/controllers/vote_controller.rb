post '/questions/:id/votes' do
  authenticate!
  if question = Question.find_by(id: params[:id])
    question.votes << Vote.find_or_initialize_by(voter: current_user, value: vote_type(params[:type]))
  end
  if request.xhr?
    question.total_votes
  else
    redirect '/questions'
  end
end

post '/comments/:id/votes' do
  authenticate!
  if comment = Comment.find_by(id: params[:id])
    comment.votes << Vote.find_or_initialize_by(voter: current_user, value: vote_type(params[:type]))
  end
  if request.xhr?
    comment.total_votes
  else
    redirect '/questions'
  end
end

post '/answers/:id/votes' do
  authenticate!
  if answer = Answer.find_by(id: params[:id])
    answer.votes << Vote.find_or_initialize_by(voter: current_user, value: vote_type(params[:type]))
  end
  if request.xhr?
    answer.total_votes
  else
    redirect '/questions'
  end
end
