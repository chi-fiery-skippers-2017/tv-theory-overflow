class Question < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :best_answer, class_name: "Answer"
  has_many :answers
  belongs_to :author, class_name: "User"

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :author_id
end
