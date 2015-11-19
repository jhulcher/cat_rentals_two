class ApplicationController < ActionController::Base

  before_action :go_to_cats_index, only: [:new, :create, :edit, :update]

  def go_to_cats_index
    redirect_to cats_url unless current_user
  end

  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by( session_token: session[:session_token] )
  end

  def login_user!
    session[:session_token] = @user.session_token
  end

end
