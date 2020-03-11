# frozen_string_literal: true

module UsersHelper
  def current_name
    current_user.fullname
  end

  def timeline_user(user)
    works = user.works
    render partial: 'shared/timeline', locals: { works: works }
  end

  def timeline_followed(user)

    #followed = 
    User.all.ordered_by_most_recent.where("id IN (?)",followers(user))

    #render partial: 'user', locals: { user: followed }
  end

  def current_user?(user)
    current_user == user
  end
  
end
  