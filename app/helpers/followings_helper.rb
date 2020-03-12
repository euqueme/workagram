module FollowingsHelper
  def following
    current_user.following.ids.empty? ? 0 : current_user.following.ids
  end

  def followers(user)
    user.followers.ids.empty? ? 0 : user.followers.ids
  end

  def following?(user)
    !current_user.following.include?(user)
  end
end
