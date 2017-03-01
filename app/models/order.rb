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

  after_save :debt_set

  validates_presence_of :amount

  enum state: {Nuevo:0, Pendiente:1, Entregado:2, Pagado:3}

  def debt_set
    if self.debt.class == NilClass
      self.debt = 0
      self.save
    end
  end
end
