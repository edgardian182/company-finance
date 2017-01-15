class ExpensesController < ApplicationController
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


  private
  def expenses_params
    params.require(:expense).permit(:concept,:amount,:date,:category_id,:type_id)
  end

end
