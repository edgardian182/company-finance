class RemoveMaterialIdFromExpenses < ActiveRecord::Migration[5.0]
  def up
    remove_reference :expenses, :material, foreign_key: true
    add_column :expenses, :material, :string
  end

  def down
    add_reference :expenses, :material, foreign_key: true
    remove_column :expenses, :material, :string
  end
end
