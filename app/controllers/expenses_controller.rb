class ExpensesController < ApplicationController
  def index
    @tab = :expenses
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end
  
end
