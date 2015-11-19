class SessionsController < ApplicationController

  def go_to_cats_index
    redirect_to cats_url if @current_user
  end

  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      # @user.reset_session_token!
      login_user!
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    session[:session_token] = nil
    current_user.reset_session_token! if current_user
    render :new
  end

  private
  def user_params
    params[:user].permit(:user_name, :password)
  end

end
