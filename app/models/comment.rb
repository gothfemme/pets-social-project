class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true

  def create_date
    self.created_at.localtime.strftime("%I:%M%P %B %d %Y")
  end
end
