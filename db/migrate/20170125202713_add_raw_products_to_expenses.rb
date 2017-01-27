class AddRawProductsToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_reference :expenses, :product, foreign_key: true
    add_column :expenses, :quantity, :float
    add_column :expenses, :measure, :string
  end
end
