class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :concept
      t.date :date
      t.decimal :amount
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :type, foreign_key: true

      t.timestamps
    end
  end
end
