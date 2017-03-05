class ClientsController < ApplicationController
  before_action :set_client, only: [:edit,:show,:update,:destroy]
  before_action :set_clients, only: [:index, :create, :update, :destroy]

  def index
    @tab = :clients

  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    # Siempre lo esta guardando con el current_user --> ARREGLAR
    @client.user = current_user if !params[:client][:user_id]

    respond_to do |format|
      if @client.save
        format.html {redirect_to clients_path, notice: 'El cliente se ha creado con éxito.'}
        format.js {}
      else
        format.html {render :new}
        format.js {}
      end
    end
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to clients_path, notice: 'El cliente ha sido actualizado' }
        format.js {}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    if current_user.superadmin_role?
      @client.destroy
    else
      flash[:warning] = "No tienes permiso para eliminar clientes"
    end
  end

  private
  def client_params
    params.require(:client).permit(:name,:lastname,:address,:phone,:email,:city,:reference,:photo,:user_id)
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def set_clients
    if current_user.superadmin_role? || current_user.supervisor_role?
      @clients = Client.all
    else
      @clients = Client.all.where(user: current_user)
    end

    if params[:all]
      if current_user.superadmin_role? || current_user.supervisor_role?
        cookies.delete(:vendedor)
      else
        @clients
      end
    end

    if cookies[:pedidos] && params[:pedidos]
      cookies.delete(:pedidos)
      @clients = @clients.joins(:orders).group("orders.client_id").order("count(orders.client_id) ASC")
    elsif params[:pedidos]
      cookies[:pedidos] = params[:pedidos]
      @clients = @clients.joins(:orders).group("orders.client_id").order("count(orders.client_id) DESC")
    end

    if cookies[:ultimo] && params[:ultimo]
      cookies.delete(:ultimo)
      @clients = @clients.joins(:orders).group("orders.client_id").order("MAX(orders.date) ASC")
    elsif params[:ultimo]
      cookies[:ultimo] = params[:ultimo]
      @clients = @clients.joins(:orders).group("orders.client_id").order("MAX(orders.date) DESC")
    end

    if params[:vendedor].present?
      cookies[:vendedor] = {value: params[:vendedor], expires: 1.hour.from_now}
      @clients = @clients.where(user_id: params[:vendedor].to_i);
      # @cookie_type = params[:type]
    elsif cookies[:vendedor]
      @clients = @clients.where(user_id: cookies[:vendedor].to_i);
      # @cookie_type = cookies[:type]
    end

    if params[:search_client]
      @clients = @clients.where("LOWER(name) LIKE ? OR LOWER(lastname) LIKE ? OR LOWER(reference) LIKE ?", "%#{params[:search_client].downcase}%", "%#{params[:search_client].downcase}%", "%#{params[:search_client].downcase}%")
    end
  end
end
