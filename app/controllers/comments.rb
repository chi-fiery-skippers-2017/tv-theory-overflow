get '/comments/new' do
  if request.xhr?
    erb :"comments/_new_form", layout: false
  else
    puts "nope"
  end
end
