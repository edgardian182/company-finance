# == Schema Information
#
# Table name: materials
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Material < ApplicationRecord
  belongs_to :category

  # has_many :expenses
end
