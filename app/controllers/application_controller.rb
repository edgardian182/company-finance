class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def require_admin
    if !current_user.superadmin_role? || !current_user.supervisor_role?
      flash[:notice] = "Solo puedes ingresar si eres administrador"
      redirect_to clients_path
    end
  end
end
