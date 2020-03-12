class FollowingsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.following << @user
    flash[:success] = "Following #{@user.fullname}"
    redirect_to root_path
  end
end
