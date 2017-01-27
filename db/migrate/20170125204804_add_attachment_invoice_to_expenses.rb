class AddAttachmentInvoiceToExpenses < ActiveRecord::Migration
  def self.up
    change_table :expenses do |t|
      t.attachment :invoice
    end
  end

  def self.down
    remove_attachment :expenses, :invoice
  end
end
