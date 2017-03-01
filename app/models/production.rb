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

class Production < ApplicationRecord

  after_save :quantity_left_set
  before_update :quantity_left_set

  validates_presence_of :reference, :quantity

  enum size: {P200g:0, P1000g:1, P2000g:2}

  def quantity_left_set
    if self.quantity_left.nil?
      self.quantity_left = self.quantity
      self.save
    elsif self.quantity_left > self.quantity
      self.quantity_left = self.quantity
      self.save
    end
  end

end
