class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :lastname
      t.string :address
      t.string :phone
      t.string :email
      t.string :city
      t.string :reference

      t.timestamps
    end
  end
end
