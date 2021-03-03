class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(session[:id])
  end

  def ensure_user
    redirect_to '/sessions' if !session[:id]
  end
end
