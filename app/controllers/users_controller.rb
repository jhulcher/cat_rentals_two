class UsersController < ApplicationController

  before_action :go_to_cats_index, only: [:new, :create]

  def go_to_cats_index
    redirect_to cats_url if current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login_user!
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def user_params
    params[:user].permit(:user_name, :password)
  end
end
