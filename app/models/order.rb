# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  state          :integer
#  date           :date
#  amount         :decimal(, )
#  reference      :string
#  paid           :boolean
#  debt           :decimal(, )
#  delivered_date :date
#  pay_date       :date
#  client_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  belongs_to :client
end
