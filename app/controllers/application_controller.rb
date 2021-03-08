class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_path

  def current_user
    User.find(session[:id]) if session[:id]
  end

  def ensure_user
    redirect_to '/sessions' unless session[:id]
  end

  def current_user_path
    "/users/#{current_user.id}"
  end
end
