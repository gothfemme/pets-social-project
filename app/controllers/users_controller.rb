class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == session[:user_id]
      redirect_to root_path
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      @user = current_user
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :location,
      :image,
      :bio,
      :password,
      :password_confirmation
    )
  end

end
