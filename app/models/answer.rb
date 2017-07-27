class Answer < ActiveRecord::Base
  has_many :votes, as: :votable_type
  has_many :comments, as: :commentable_type
  belongs_to :question
  belongs_to :author, class_name: "User"

end
