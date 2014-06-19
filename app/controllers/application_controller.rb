class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:current_user_id]
      @current_user ||= User.find(session[:current_user_id])
    else
      nil
    end
  end

  def verify_logged_in
    if current_user.nil?
      redirect_to new_login_path, notice: "You must log in to add or edit posts."
    end
  end
end
