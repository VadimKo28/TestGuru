class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(resource)
    flash[:notice] = "Привет, #{resource.first_name}!"

    if resource.admin?
      admin_tests_path
    else
      super
    end
  end

  def default_url_options
    { lang: I18n.locale } unless I18n.locale == params[:lang]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
