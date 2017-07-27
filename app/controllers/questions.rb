get '/questions' do
  @questions = Question.all

  erb :"questions/index"
end

get '/questions/new' do
  erb :"questions/new"
end
