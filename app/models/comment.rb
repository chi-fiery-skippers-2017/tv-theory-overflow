class Comment < ActiveRecord::Base
  has_many :votes, as: :votable_type
  belongs_to :commentable_type, polymorphic: true
  belongs_to :author, class_name: "User"
end
