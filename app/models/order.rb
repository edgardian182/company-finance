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
#  user_id        :integer
#

class Order < ApplicationRecord
  belongs_to :client
  belongs_to :user

  enum state: {Nuevo:0, Pendiente:1, Entregado:2, Pagado:3}
end
