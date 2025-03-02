class ApplicationController < ActionController::Base
  before_action :set_path, only: :authenticate!
  helper_method :logged_in?,
                :current_user

  private

  def authenticate!
    unless current_user
      redirect_to login_path
    end
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  private

  def set_path
    session[:beginning_path] = request.path
  end
end
