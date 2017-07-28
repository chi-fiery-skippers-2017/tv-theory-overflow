class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  belongs_to :question
  belongs_to :author, class_name: "User"

  validates :content, :author_id, :question_id, presence: true
end
