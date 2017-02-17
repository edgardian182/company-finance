class OrdersController < ApplicationController
  before_action :set_order, only: [:show,:edit,:update,:destroy]
  before_action :set_orders, only: [:index, :create, :update, :destroy]

  def index
    @tab = :orders

  end

  def new
    @order = Order.new
  end

  def create
    @client = Client.find(params[:client_id])

    @order = Order.new(order_params)
    # El vendedor de la orden será el current_user o el especificado por un superadmin
    @order.user = current_user if !params[:order][:user_id]

    @order.client_id = params[:client_id]

    respond_to do |format|
      if @order.save
        format.html {redirect_to orders_path, notice: 'La orden se ha creado con éxito.'}
        format.js {}
      else
        format.html {render :new}
      end
    end
  end

  def show
  end

  def edit
  end

  def update

    if params[:pago] == "ready"
      respond_to do |format|
        if @order.update(debt: 0, paid: true, state:3)
          format.html { redirect_to orders_path, notice: 'El pedido ha sido actualizado' }
          format.js {}
        else
          format.html { render :new }
        end
      end
    elsif params[:pago] == "notready"
      respond_to do |format|
        if @order.update(debt: @order.amount, paid: false, state:2)
          format.html { redirect_to orders_path, notice: 'El pedido ha sido actualizado' }
          format.js {}
        else
          format.html { render :new }
        end
      end
    else
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to orders_path, notice: 'El pedido ha sido actualizado' }
          format.js {}
        else
          format.html { render :new }
        end
      end
    end
  end

  def destroy
    if current_user.superadmin_role? || current_user.supervisor_role?
      @order.destroy
    else
      flash[:warning] = "No tienes permiso para eliminar pedidos"
    end
  end

  private
  def order_params
    params.require(:order).permit(:state,:date,:amount,:reference,:client_id,:paid,:debt,:delivered_date,:pay_date,:user_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def set_orders
    if current_user.superadmin_role? || current_user.supervisor_role?
      @orders = Order.all
    else
      @orders = Order.all.where(user: current_user)
    end

    if params[:date_order].present?
      cookies[:date_order] = {value: params[:date_order], expires: 1.hour.from_now}
      date_filter
    elsif cookies[:date_order]
      params[:date_order] = cookies[:date_order]
      date_filter
    else
      @orders = @orders.order("date DESC").where("date BETWEEN ? AND ?", Date.current.beginning_of_month, Date.current.end_of_month)
    end

    if params[:mora]
      @orders = @orders.where("debt > 0")
    end
    if params[:all]
      if current_user.superadmin_role? || current_user.supervisor_role?
        # @orders = @orders.where(user_id: true)
        cookies.delete(:vendedor)
      else
        @orders
      end
    end

    if params[:vendedor].present?
      cookies[:vendedor] = {value: params[:vendedor], expires: 1.hour.from_now}
      @orders = @orders.where(user_id: params[:vendedor].to_i);
      # @cookie_type = params[:type]
    elsif cookies[:vendedor]
      @orders = @orders.where(user_id: cookies[:vendedor].to_i);
      # @cookie_type = cookies[:type]
    end

    if params[:search_order]
      clientes = Client.where("name LIKE ? OR lastname LIKE ?", "%#{params[:search_order]}%", "%#{params[:search_order]}%")
      @orders = @orders.where(client_id: clientes.ids)
    end
  end

  def date_filter
    date = Date.parse(params[:date_order])
    @orders = @orders.order("date DESC").where("date BETWEEN ? AND ?", date.beginning_of_month, date.end_of_month)
  end
end
