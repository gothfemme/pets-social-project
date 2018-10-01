class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes, source: :user

  def vote_count
    self.votes.count
  end

  def is_trending?
    self.vote_count > 10
  end

  def create_date
    self.created_at.localtime.strftime("%I:%M%P %B %d %Y")
  end
end
