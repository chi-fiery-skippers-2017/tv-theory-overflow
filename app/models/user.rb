class User < ActiveRecord::Base
  has_many :questions, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :votes, foreign_key: :voter_id

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  validate :validate_password

  include BCrypt

  def verify_password(input_password)
    self.password == input_password
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def validate_password
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end

end
