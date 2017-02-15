class ExpensesController < ApplicationController
  before_action :get_expense, only: [:edit,:show,:update,:destroy]
  before_action :set_expenses, only: [:index, :create, :update, :destroy]
  before_action :send_parameters, only: [:edit, :new, :update]
  before_action :require_admin

  def index
    @tab = :expenses
    # @expenses = Expense.all
    @types = Type.all
    @categories = Category.all.order('name')

  end

  def new
    @expense = Expense.new
  end

  def create
    # @expenses = Expense.all  # Se usa para actualizar el Average
    @expense = Expense.new(expenses_params)
    @expense.user = current_user

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'El gasto se ha creado con éxito' }
        # format.json { render :show, status: :created, location: @client }
        format.js {}
      else
        format.html { render :new }
        # format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end


  end

  def edit
    # debugger
  end

  def show

  end

  def update
    # debugger
    # @expenses = Expense.all  # Se usa para actualizar el Average
    if current_user.superadmin_role? || (@expense.user == current_user)
      respond_to do |format|
        if @expense.update(expenses_params)
          format.html { redirect_to expenses_path, notice: 'Expense was successfully updated.' }
          format.js {}
        else
          format.html { render :new }
        end
      end
    else
      flash[:warning] = "No creaste este gasto así que no le puedes editar"
    end
  end

  def destroy
    # @expenses = Expense.all  # Se usa para actualizar el Average
    if current_user.superadmin_role? || (@expense.user == current_user)
      @expense.destroy
    else
      flash.now[:warning] = "No creaste este gasto así que no le puedes eliminar"
      render 'index'
    end
  end


  private
  def expenses_params
    params.require(:expense).permit(:concept,:amount,:date,:category_id,:type_id,:invoice,:fund_id,:measure,:quantity,:material)
  end

  def get_expense
    @expense = Expense.find(params[:id])
  end

  def set_expenses
    # @expenses = Expense.all.order("date DESC").where("cast(strftime('%m', date) as int) = ?", Time.now.month)
    if params[:date].present?
      cookies[:date] = {value: params[:date], expires: 1.hour.from_now}
      date_filter
    elsif cookies[:date]
      params[:date] = cookies[:date]
      date_filter
    else
      @expenses = Expense.all.order("date DESC").where("date BETWEEN ? AND ?", Date.current.beginning_of_month, Date.current.end_of_month)
    end

    if params[:all]
      cookies.delete(:type)
      cookies.delete(:category)
    end

    if params[:type].present? && params[:type] != ""
      cookies[:type] = {value: params[:type], expires: 1.hour.from_now}
      @expenses = @expenses.where("type_id = ?", params[:type]);
      @cookie_type = params[:type]
    elsif cookies[:type]
      @expenses = @expenses.where("type_id = ?", cookies[:type]);
      @cookie_type = cookies[:type]
    end

    if params[:category].present? && params[:category] != ""
      cookies[:category] = {value: params[:category], expires: 1.hour.from_now}
      @expenses = @expenses.where("category_id = ?", params[:category]);
      @cookie_category = params[:category]
    elsif cookies[:category]
      @expenses = @expenses.where("category_id = ?", cookies[:category]);
      @cookie_category = cookies[:category]
    end

  end

  def send_parameters
    @parameters = params
  end

  def date_filter
    date = Date.parse(params[:date])
    @expenses = Expense.all.order("date DESC").where("date BETWEEN ? AND ?", date.beginning_of_month, date.end_of_month)
  end


end
