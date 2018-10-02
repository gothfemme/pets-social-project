class VotesController < ApplicationController

  def create
    if Vote.find_by(post_id:params[:post_id], user:current_user)
      #then they've already voted
      redirect_to post_path(Post.find(params[:post_id]))
    else
      @vote = Vote.new(post_id:params[:post_id], user:current_user)
      @vote.save
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
