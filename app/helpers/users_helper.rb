# frozen_string_literal: true

module UsersHelper
  def current_name
    current_user.fullname
  end

  def timeline_user(user)
    works = user.works
    render partial: 'shared/timeline', locals: { works: works }
  end

  def timeline_followers(user)

    user_followers = User.all.ordered_by_most_recent.where("id IN (?)",followers(user))

    render partial: 'users/timeline_followers', locals: { users: user_followers }
  end

  def current_user?(user)
    current_user == user
  end

  def picture_form(user, simbol)
    render partial: 'users/picture_form', locals: { user: user, simbol: simbol } if current_user? user
  end

  def follow_form(user)
    render partial: 'users/follow_form', locals: { user: user } if following? user
  end
  
end
  