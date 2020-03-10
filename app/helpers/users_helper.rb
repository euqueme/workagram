# frozen_string_literal: true

module UsersHelper
  def current_name
    current_user.fullname
  end

  def timeline_user(user)
    works = user.works
    render partial: 'shared/timeline', locals: { works: works }
  end

  def current_user?(user)
    current_user == user
  end
  
end
  