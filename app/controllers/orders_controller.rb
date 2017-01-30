class OrdersController < ApplicationController
  before_action :set_order, only: [:show,:edit,:update,:destroy]

  def index
    @tab = :orders
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @client = Client.find(params[:client_id])

    @order = Order.new(order_params)
    @order.user = current_user
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
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'El pedido ha sido actualizado' }
        format.js {}
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @order.destroy
  end

  private 
  def order_params
    params.require(:order).permit(:state,:date,:amount,:reference,:client_id,:paid,:debt,:delivered_date,:pay_date,:user_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
