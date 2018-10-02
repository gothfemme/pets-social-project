class UsersController < ApplicationController

  before_action :found_user, only: %i[show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @votes = Vote.create
    @posts = Post.all
  end


  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :location,
      :bio,
      :password,
      :password_confirmation
    )
  end

  def found_user
      @user = User.find(params[:id])
  end

end
