class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.date :entry_date
      t.date :due_date
      t.string :reference
      t.integer :size
      t.date :out_date
      t.string :description
      t.float :quantity
      t.float :quantity_left

      t.timestamps
    end
  end
end
