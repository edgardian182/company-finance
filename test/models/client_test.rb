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

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
