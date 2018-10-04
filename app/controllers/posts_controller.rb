class PostsController < ApplicationController
  before_action :login_authorize, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_post, only: [:show, :destroy]

  def index
    posts = Post.search_and_filter(params[:search],params[:filter],params[:order])
    @page_length = 20
    range = get_current_page_range(posts, params[:query])
    get_pages(posts, range)
  end

  def show
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

  def destroy
    if @post.user == current_user
      @post.destroy
    end
    redirect_to root_path
  end

  private

  def get_post
    @post = Post.find(params[:id])
  end
end
