class ExpensesController < ApplicationController
  before_action :get_expense, only: [:edit,:update,:destroy]

  def index
    @tab = :expenses
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expenses_params)
    @expense.user = current_user
    @expense.save
  end

  def edit
  end

  def update
    @expense.update(expenses_params)
  end

  def destroy
    @expense.destroy
  end


  private
  def expenses_params
    params.require(:expense).permit(:concept,:amount,:date,:category_id,:type_id)
  end

  def get_expense
    @expense = Expense.find(params[:id])
  end

end
