# frozen_string_literal: true

module UsersHelper
    def current_name
      current_user.fullname
    end
  
  end
  