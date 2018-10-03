class CommentsController < ApplicationController

  def create
    comment = Comment.new(content:params[:comment][:content],user:current_user,post_id:params[:post_id])
    @post = Post.find(params[:post_id])
    if comment.save
      redirect_to post_path(@post)
    else
      # flash error
      @comment = Comment.new
      render "posts/show"
    end
  end

  def edit
    @post = Post.includes(:user).find(params[:post_id])
    @vote = Vote.find_by(post_id:params[:post_id],user:current_user)
    @new_vote = Vote.new
    @comment = Comment.find(params[:id])
    render 'posts/show'
  end

  def update
    # verify it's by the user
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.user == current_user
      @comment.update(content:params[:comment][:content])
    else
      # flash error
    end
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    if @comment.user == current_user
      @comment.destroy
    else
      # flash error
    end
    redirect_to post_path(@post)
  end

end
