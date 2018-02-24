class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_action_and_controller

  private

  def set_locale
    if cookies[:language]
      I18n.locale = cookies[:language]
    else
      I18n.locale = cookies[:language] = http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
    end
  end

  def user_not_authorized
      flash[:warning] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
  end

  ## STRONG PARAMETRES FOR DEVISE
  def configure_permitted_parameters
    added_attrs = [:username, :email, :avatar, :password, :password_confirmation, :remember_me, :about, :email_visible, :fullname]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_action_and_controller
    @search = Pet.search(params[:q])
    @pets = @search.result
  end
end