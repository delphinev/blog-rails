class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  include HttpAcceptLanguage::AutoLocale
  protect_from_forgery with: :exception
  before_action :set_locale

  def language
    if I18n.available_locales.include? params[:lang].to_sym
      session[:lang] = params[:lang]
      I18n.locale = session[:lang] #inutile avec redirect_to
    end
    redirect_to request.referrer
  end

  private
  def set_locale
    if session[:lang]
      I18n.locale = session[:lang]
    end
  end
end
