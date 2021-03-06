class ProductionsController < ApplicationController
  before_action :get_production, only: [:edit,:show,:update,:destroy]
  before_action :require_admin
  before_action :set_productions, only: [:index, :create, :update, :destroy]

  def index
    @tab = :production
  end

  def new
    @production = Production.new
  end

  def create
    @production = Production.new(productions_params)

    respond_to do |format|
      if @production.save
        format.html { redirect_to productions_path, notice: 'La producción se ha creado con éxito' }
        # format.json { render :show, status: :created, location: @client }
        format.js {}
      else
        format.html { render :new }
        format.js {}
        # format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end

  end

  def edit
  end

  def show
  end

  def update
    if current_user.superadmin_role? || current_user.supervisor_role?
      respond_to do |format|
        if @production.update(productions_params)
          format.html { redirect_to productions_path, notice: 'Production was successfully updated.' }
          format.js {}
        else
          format.html { render :new }
        end
      end
    else
      flash[:warning] = "No eres un usuario autorizado para editar este registro"
    end
  end

  def destroy
    if current_user.superadmin_role? || current_user.supervisor_role?
      @production.destroy
    else
      flash.now[:warning] = "No estas autorizado para eliminar este registro"
      render 'index'
    end
  end


  private
  def productions_params
    params.require(:production).permit(:entry_date,:due_date,:out_date,:reference,:size,:description,:quantity,:quantity_left)
  end

  def get_production
    @production = Production.find(params[:id])
  end

  def set_productions
    if params[:date_production].present?
      cookies[:date_production] = {value: params[:date_production], expires: 1.hour.from_now}
      date_filter
    elsif cookies[:date_production]
      params[:date_production] = cookies[:date_production]
      date_filter
    else
      @productions = Production.all.order("entry_date DESC").where("entry_date BETWEEN ? AND ?", Date.current.beginning_of_month, Date.current.end_of_month)
    end
  end

  def date_filter
    date = Date.parse(params[:date_production])
    @productions = Production.all.order("entry_date DESC").where("entry_date BETWEEN ? AND ?", date.beginning_of_month, date.end_of_month)
  end

end