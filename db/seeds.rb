require 'faker'

users_wanted = 4
questions_wanted = 10
answers_wanted = 16
comments_wanted = 30

users_needed = users_wanted - User.count

def add_votes(table_entry)
  rand(50).times { table_entry.votes << Vote.new(voter: User.all.sample, value: (rand(0..1) * 2 - 1)) }
end

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

  add_votes(question)
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

  add_votes(answer)
end

comments_to_questions_needed = comments_wanted - (Comment.count / 2)

comments_to_questions_needed.times do
  comment = {
    content: Faker::Seinfeld.quote,
    commentable: Question.all.sample,
    author: User.all.sample
  }

  comment = Comment.new(comment)
  comment.save

  add_votes(comment)
end

comments_to_answers_needed = comments_wanted - (Comment.count / 2)

comments_to_answers_needed.times do
  comment = {
    content: Faker::Seinfeld.quote,
    commentable: Answer.all.sample,
    author: User.all.sample
  }

  comment = Comment.new(comment)
  comment.save

  add_votes(comment)
end
