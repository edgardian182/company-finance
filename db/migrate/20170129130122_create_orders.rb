class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :state
      t.date :date
      t.decimal :amount
      t.string :reference
      t.boolean :paid
      t.decimal :debt
      t.date :delivered_date
      t.date :pay_date
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
