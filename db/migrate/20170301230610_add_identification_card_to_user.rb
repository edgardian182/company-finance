class AddIdentificationCardToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :identification_card, :string
  end
end
