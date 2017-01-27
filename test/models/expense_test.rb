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

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
