# == Schema Information
#
# Table name: expenses
#
#  id                   :integer          not null, primary key
#  concept              :string
#  date                 :date
#  amount               :decimal(, )
#  user_id              :integer
#  category_id          :integer
#  type_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_id           :integer
#  quantity             :float
#  measure              :string
#  fund_id              :integer
#  invoice_file_name    :string
#  invoice_content_type :string
#  invoice_file_size    :integer
#  invoice_updated_at   :datetime
#  material             :string
#

class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :type
  belongs_to :fund
  # belongs_to :material


  has_attached_file :invoice, styles: {medium: "300x300", thumb: "100x100>"}


  validates_attachment_content_type :invoice, content_type: /\Aimage\/.*\Z/
  
  # Carga Expenses junto a Types y Categories asociados a ellos en una sola consulta
  Expense.includes(:type, :category)

end
