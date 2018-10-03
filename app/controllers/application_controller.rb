class ApplicationController < ActionController::Base
  include SessionsHelper
  include PostsHelper

  private

  def login_authorize
    redirect_to login_path unless logged_in?
  end

end
