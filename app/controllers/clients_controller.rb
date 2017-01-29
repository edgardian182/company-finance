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
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user

    respond_to do |format|
      if @client.save
        format.html {redirect_to clients_path, notice: 'El cliente se ha creado con éxito.'}
        format.js {}
      else
        format.html {render :new}
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private 
  def client_params
    params.require(:client).permit(:name,:lastname,:address,:phone,:email,:city,:reference,:photo)
  end
end
