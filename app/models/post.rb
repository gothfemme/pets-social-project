class Post < ApplicationRecord
  belongs_to :user
  has_many :votes
  has_many :voters, through: :votes, source: :user
  has_many :comments
  has_many :commenters, through: :comments, source: :user

  validates :title, presence: true
  validates :image, presence: true

  def vote_count
    self.votes.count
  end

  def self.search_and_filter(search_term, filter_term, order_term)
    order_term ||= "asc"
    searched = self.search(search_term)
    if filter_term.nil?
      return searched
    else
      searched.filter(filter_term, order_term)
    end
  end

  def self.search(search_term)
    if search_term
      self.where('title LIKE ?', "%#{search_term}%")
    else
      self.all
    end
  end

  def self.filter(filter_term, order_term)
    if filter_term
      case filter_term
      when "pop"
        self.popularity_sort(order_term)
      when "date"
        self.time_sort(order_term)
      when "abc"
        self.abc_sort(order_term)
      end
    else
      return
    end
  end

  def self.time_sort(order_term)
    case order_term
    when "asc"
      self.order('created_at ASC')
    when "desc"
      self.order('created_at DESC')
    end
  end

  def self.popularity_sort(order_term)
    case order_term
    when "desc"
      self.select("posts.*, COUNT(votes.id) vote_count")
          .joins(:votes)
          .group("post_id")
          .order("vote_count DESC")
    when "asc"
      self.select("posts.*, COUNT(votes.id) vote_count")
          .joins(:votes)
          .group("post_id")
          .order("vote_count ASC")
    end
  end

  def self.abc_sort(order_term)
    case order_term
    when "asc"
      self.order('title ASC')
    when "desc"
      self.order('title DESC')
    end
  end

  def is_trending?
    self.vote_count > 10
  end

  def create_date
    self.created_at.localtime.strftime("%I:%M%P %B %d %Y")
  end
end
