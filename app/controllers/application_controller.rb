class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale

  private
    def set_locale
      if cookies[:language]
        I18n.locale = cookies[:language]
      else
        I18n.locale = cookies[:language] = http_accept_language.compatible_language_from(I18n.available_locales)
      end
    end

end
