module FollowingsHelper
    def following
        current_user.following.ids.empty? ? 0 : current_user.following.ids
    end
end
