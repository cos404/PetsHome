class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale


  def can_edit?
  end
  def can_delete?
  end
  def can_create?
  end

  def administrator?
  end
  def moderator?
  end
  def curator?
  end
  def employee?
  end
  def volunteer?
  end
  def developer?
  end
  def disagner?
  end
  def user?
  end


  private
    def set_locale
      if cookies[:language]
        I18n.locale = cookies[:language]
      else
        I18n.locale = cookies[:language] = http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale
      end
    end

end
