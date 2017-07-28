post '/votes' do
  redirect '/sessions/new' unless authenticate!
  if request.xhr?
    "hit ajax request"
  else
    redirect '/404'
  end
end
