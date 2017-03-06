class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_locale

  def set_locale
    I18n.locale = :es
    if params[:locale]
      I18n.locale = params[:locale].to_sym
    end
  end

  def require_admin
    unless current_user.superadmin_role? || current_user.supervisor_role?
      flash[:warning] = "Solo puedes ingresar si eres administrador"
      redirect_to clients_path
    end
  end
end
