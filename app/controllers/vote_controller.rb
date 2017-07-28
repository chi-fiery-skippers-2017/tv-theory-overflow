post '/questions/:id/votes' do
  # redirect '/sessions/new' unless authenticate!
  if question = Question.find_by(id: params[:id])
    question.votes << Vote.new(voter: current_user, value: vote_type(params[:type]))
  end

  if request.xhr?
    question.total_votes
  else
    "nil"
  end
end
