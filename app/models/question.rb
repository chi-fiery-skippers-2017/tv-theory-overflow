class Question < ActiveRecord::Base
  has_many :votes, as: :votable_type
  has_many :comments, as: :commentable_type
  has_one :best_answer, class_name: "Answer"
end
