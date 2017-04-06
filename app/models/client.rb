# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string
#  lastname   :string
#  address    :string
#  phone      :string
#  email      :string
#  city       :string
#  reference  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ApplicationRecord
  before_save :capitalize_fields

  belongs_to :user

  has_many :orders, dependent: :destroy

  validates_presence_of :name, :lastname, :city

  def capitalize_fields
    self.name = self.name.capitalize
    self.lastname = self.lastname.capitalize
    self.city = self.city.capitalize
  end

end
