require 'faker'

users_wanted = 4
questions_wanted = 10
answers_wanted = 24
comments_wanted = 24

users_needed = users_wanted - User.count

users_needed.times do
  user = {
    username: Faker::RickAndMorty.unique.character,
    email: "fake@example.net",
    password: "password"
  }

  user = User.new(user)
  user.save
end

questions_needed = questions_wanted - Question.count

questions_needed.times do
  question = {
    title: Faker::StarWars.unique.quote,
    description: Faker::Hipster.paragraph,
    author: User.all.sample
  }

  question = Question.new(question)
  question.save
end

answers_needed = answers_wanted - Answer.count

answers_needed.times do
  answer = {
    content: Faker::RickAndMorty.unique.quote,
    question: Question.all.sample,
    author: User.all.sample
  }

  answer = Answer.new(answer)
  answer.save
end

comments_to_questions_needed = (comments_wanted / 2) - Comment.count

comments_to_questions_needed.times do
  comment = {
    content: Faker::Seinfeld.quote,
    commentable: Question.all.sample,
    author: User.all.sample
  }

  comment = Comment.new(comment)
  comment.save
end

comments_to_answers_needed = (comments_wanted / 2) - Comment.count

comments_to_answers_needed.times do
  comment = {
    content: Faker::Seinfeld.quote,
    commentable: Answer.all.sample,
    author: User.all.sample
  }

  comment = Comment.new(comment)
  comment.save
end
