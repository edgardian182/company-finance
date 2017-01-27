class AddFundsReferencesToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :fund, foreign_key: true
  end
end
