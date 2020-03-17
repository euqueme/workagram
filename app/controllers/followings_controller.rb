class FollowingsController < ApplicationController
  before_action :logged_in_user

  def create
    follow = Following.new(follower_id: current_user.id, followed_id: following_params)
    if follow.save
      flash[:success] = "Following User"
    else
      flash[:danger] = "You can't follow the User"
    end
      redirect_to root_path
  end

  private

  def following_params
    params.require(:followed_id)
  end
end
