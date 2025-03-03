class ApplicationController < ActionController::Base
  before_action :authenticate!

  helper_method :logged_in?,
                :current_user

  private

  def authenticate!
    unless current_user
      session[:target_path] = request.path

      redirect_to login_path
    end
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
