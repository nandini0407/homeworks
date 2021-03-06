class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
    return nil if @current_user.nil?
    @current_user
  end

  def logged_in?
    return true if current_user
    false
  end

  def login(user)
    session[:session_token] = user.reset_session_token
  end

  def logout
    current_user.reset_session_token if current_user
    session[:session_token] = nil
  end

  def require_user
    redirect_to new_session_url unless current_user
  end

end
