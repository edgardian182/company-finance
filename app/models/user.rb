# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
 # email                  :string           default(""), not null
 # encrypted_password     :string           default(""), not null
 # reset_password_token   :string
 # reset_password_sent_at :datetime
 # remember_created_at    :datetime
 # sign_in_count          :integer          default(0), not null
 # current_sign_in_at     :datetime
 # last_sign_in_at        :datetime
 # current_sign_in_ip     :string
 # last_sign_in_ip        :string
 # created_at             :datetime         not null
 # updated_at             :datetime         not null
 # superadmin_role        :boolean          default(FALSE)
 # supervisor_role        :boolean          default(FALSE)
 # user_role              :boolean          default(TRUE)
 # name                   :string
 # lastname               :string
 # address                :string
 # phone                  :string
 # city                   :string
 # type                   :integer
 # identification_card    :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable :registerable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :expenses
  has_many :clients
  has_many :orders
end
