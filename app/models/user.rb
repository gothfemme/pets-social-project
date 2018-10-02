class User < ApplicationRecord
  has_many :votes
  has_many :posts
  has_secure_password
  validates :username,  presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: false}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX }
end
