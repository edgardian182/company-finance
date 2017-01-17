class ExpensesController < ApplicationController
  before_action :get_expense, only: [:edit,:update,:destroy]
  before_action :set_expenses, only: [:index, :create, :update, :destroy]

  def index
    @tab = :expenses
    # @expenses = Expense.all
    @types = Type.all
    @categories = Category.all
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
  end

  def update
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
    @expenses = Expense.all
  end

end
