# frozen_string_literal: true

module SessionsHelper
    def remember(user)
      # user.remember
      cookies.permanent.signed[:username] = user.username
      # cookies.permanent[:remember_token] = user.remember_token
      @current_user = user
    end
  
    # Logs in the given user.
    def log_in(user)
      session[:username] = user.username
    end
  
    def current_user
      @current_user ||= User.find_by(username: cookies.signed[:username])
    end
  
    def current_user=(user)
      @current_user = user
    end
  
    def forget(user)
      cookies.delete(:username)
    end
  
    def log_out
      forget(current_user)
    end
  
    def logged_in?
      !current_user.nil?
    end
  end
  