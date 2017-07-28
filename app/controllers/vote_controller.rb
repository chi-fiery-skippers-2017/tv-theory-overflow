post '/votes' do
  # redirect '/sessions/new' unless authenticate!
  if request.xhr?
    votetype params[:type]
    # case
  else
    "nil"
  end
end
