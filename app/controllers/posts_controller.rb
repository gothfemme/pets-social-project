class PostsController < ApplicationController

  def index
    @posts = Post.search_and_filter(params[:search],params[:filter],params[:order])
    page_length = 20
    view_range = (0..page_length)

    if params[:query]
      n = params[:query].to_i
      if n-page_length < 0
        n = page_length
      elsif n-page_length >= @posts.count
        n = @posts.count
      else
        view_range = (n-page_length..n)
      end
    end
    @previous_page = view_range.min unless view_range.min <= 0
    @next_page = view_range.max + page_length unless view_range.max > @posts.length
    @current_posts = @posts[view_range]
  end

  def show
    @post = Post.includes(:user).find(params[:id])
    @vote = Vote.find_by(post_id:params[:id],user:current_user)
    @new_vote = Vote.new
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title:params[:post][:title],image:params[:post][:image],user:current_user)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
end
