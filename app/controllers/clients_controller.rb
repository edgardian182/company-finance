class ClientsController < ApplicationController
  def index
    @tab = :clients
    if current_user.superadmin_role? || current_user.supervisor_role?
      @clients = Client.all
    else
      @clients = Client.all.where(user: current_user)
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def show
  end

  def destroy
  end
end
