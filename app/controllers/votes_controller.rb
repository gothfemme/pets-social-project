class VotesController < ApplicationController
  before_action :login_authorize, only: [:create, :destroy]

  def create
    if Vote.find_by(post_id:params[:post_id], user:current_user)
      redirect_to post_path(Post.find(params[:post_id]))
    else
      @vote = Vote.create(post_id:params[:post_id], user:current_user)
      redirect_to post_path(@vote.post)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    vote = Vote.find_by(post:@post, user:current_user)
    vote.destroy
    redirect_to post_path(@post)
  end
end
