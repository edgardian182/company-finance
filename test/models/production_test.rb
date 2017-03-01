# == Schema Information
#
# Table name: productions
#
#  id            :integer          not null, primary key
#  entry_date    :date
#  due_date      :date
#  reference     :string
#  size          :integer
#  out_date      :date
#  description   :string
#  quantity      :float
#  quantity_left :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProductionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
