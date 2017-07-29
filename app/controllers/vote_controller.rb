post '/questions/:id/votes' do
  authenticate!
  question = Question.find_by(id: params[:id])
  user = current_user
  new_value = vote_type(params[:type])
  if current_user.has_vote?(question)
    vote = question.find_vote(current_user)
    vote.update(value: new_value)
  else
    Vote.create(voter: user, votable: question, value: new_value)
  end
  if request.xhr?
    question.total_votes
  else
    redirect '/questions'
  end
end

post '/comments/:id/votes' do
  authenticate!
  comment = Comment.find_by(id: params[:id])
  user = current_user
  new_value = vote_type(params[:type])
  if current_user.has_vote?(comment)
    vote = comment.find_vote(current_user)
    vote.update(value: new_value)
  else
    Vote.create(voter: user, votable: comment, value: new_value)
  end
  if request.xhr?
    comment.total_votes
  else
    redirect '/comments'
  end
end

post '/answers/:id/votes' do
  authenticate!
  answer = Answer.find_by(id: params[:id])
  user = current_user
  new_value = vote_type(params[:type])
  if current_user.has_vote?(answer)
    vote = answer.find_vote(current_user)
    vote.update(value: new_value)
  else
    Vote.create(voter: user, votable: answer, value: new_value)
  end
  if request.xhr?
    answer.total_votes
  else
    redirect '/answers'
  end
end
