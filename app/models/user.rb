class User < ApplicationRecord
  has_many :votes
  has_many :posts

  has_secure_password

  def new
    @user = User.new
  end
end
