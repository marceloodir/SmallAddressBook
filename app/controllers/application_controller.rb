class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate

    unless session[:userid]
      redirect_to index_path
    else
      @user = current_user
    end
  end

  def current_user
    return User.find(session[:userid])
  end

  def authenticate?
    return session[:userid].present?
  end

end
