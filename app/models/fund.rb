# == Schema Information
#
# Table name: funds
#
#  id         :integer          not null, primary key
 # name       :string
 # amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Fund < ApplicationRecord
  has_many :expenses
end
