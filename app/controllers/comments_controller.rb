class CommentsController < ApplicationController
  before_action :login_authorize, only: [:create, :edit, :update, :destroy]
  before_action :get_comment, only: [:edit, :update, :destroy]
  before_action :get_post, only: [:create, :edit, :update, :destroy]

  def create
    comment = Comment.new(content:params[:comment][:content],user:current_user,post_id:params[:post_id])
    if comment.save
      flash[:success] = "Comment successfully created!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Comment cannot be blank."
      @comment = Comment.new
      render "posts/show"
    end
  end

  def edit
    @vote = Vote.find_by(post_id:params[:post_id],user:current_user)
    @new_vote = Vote.new
    render 'posts/show'
  end

  def update
    if @comment.user == current_user
      if @comment.update(content:params[:comment][:content])
        flash[:success] = "Comment successfully updated!"
      else
        flash[:danger] = "Comment cannot be blank."
        return render 'posts/show'
      end
    else
      flash[:danger] = "You are not authorized to edit this comment."
    end
    redirect_to post_path(@post)
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      flash[:success] = "Comment successfully deleted!"
    else
      flash[:danger] = "You are not authorized to delete this comment."
    end
    redirect_to post_path(@post)
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def get_post
    @post = Post.find(params[:post_id])
  end

end
