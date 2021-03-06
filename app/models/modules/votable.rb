module Votable
  def total_votes
    return "0" if self.votes.empty?
    self.votes.inject(0) {|sum, vote| sum + vote.value}.to_s
  end

  def find_vote(user)
  	Vote.find_by(voter: user, votable: self)
  end
end
