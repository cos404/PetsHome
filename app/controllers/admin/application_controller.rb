class Admin::ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery
  before_action :set_locale
  before_action :check_permission

  layout 'admin/layouts/application.html.haml'
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

    def check_permission
      redirect_to root_path unless current_user && (current_user.admin? or current_user.moderator?)
    end
end
