class ApplicationController < ActionController::Base
  include SessionsHelper


  def first_page?(range)
    range.includes(0)
  end

  def last_page?(range)
    range.includes(Post.all.length)
  end
end
