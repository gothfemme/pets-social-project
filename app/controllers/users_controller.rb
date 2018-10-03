class UsersController < ApplicationController
  before_action :login_authorize, only: [:show, :edit, :update]
  before_action :get_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    unless @user == current_user # authorization
      redirect_to root_path
    end
  end

  def update # needs authorization
    if current_user.update(user_params) # authorization
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

  def get_user
    @user = User.find(params[:id])
  end

end
