class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(session_params)
    if !user.nil?
      remember(user)
      flash[:info] = 'User Logged in'
      redirect_to root_path
    else
      flash.now[:danger] = 'User doesn\'t exist'
      render 'new'
    end
  end

  def destroy
    if logged_in?
      log_out
      flash[:info] = 'User Logged out.'
    else
      flash[:danger] = "User wasn't even logged in."
    end
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:username)
  end
end
