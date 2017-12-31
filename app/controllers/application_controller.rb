class ApplicationController < ActionController::Base
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery
  before_action :set_locale

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

end
