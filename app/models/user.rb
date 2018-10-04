class User < ApplicationRecord
  before_save { email.downcase! }
  has_many :votes
  has_many :voted_posts, through: :votes, source: :post
  has_many :posts
  has_many :comments
  has_many :commented_posts, through: :comments, source: :post
  mount_uploader :image, ImageUploader

  has_secure_password
  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX }



  def recent_posts
    self.posts.order('created_at DESC').limit(10)
  end

  def recent_likes
    self.voted_posts.order('votes.created_at DESC').limit(10)
  end
end
