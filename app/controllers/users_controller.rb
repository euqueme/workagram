class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User Created'
      redirect_to login_path
    else
      flash[:info] = 'User Creation failed'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullname)
  end

  
end
