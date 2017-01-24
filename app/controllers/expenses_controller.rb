class ExpensesController < ApplicationController
  before_action :get_expense, only: [:edit,:update,:destroy]
  before_action :set_expenses, only: [:index, :create, :update, :destroy]
  before_action :send_parameters, only: [:edit, :new, :update]

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
    @expense.save
  end

  def edit
    # debugger
  end

  def update
    # debugger
    # @expenses = Expense.all  # Se usa para actualizar el Average
    @expense.update(expenses_params)
  end

  def destroy
    # @expenses = Expense.all  # Se usa para actualizar el Average
    @expense.destroy
  end


  private
  def expenses_params
    params.require(:expense).permit(:concept,:amount,:date,:category_id,:type_id)
  end

  def get_expense
    @expense = Expense.find(params[:id])
  end

  def set_expenses
    @expenses = Expense.all.order("date")

    if params[:type].present? && params[:type] != ""
      @expenses = @expenses.where("type_id = ?", params[:type]);
    end
  end

  def send_parameters
    @parameters = params
  end

end
