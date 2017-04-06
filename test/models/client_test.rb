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

  def setup
    @c1 = clients(:client1) # Brings it from fixtures/clients.yml
    @c2 = clients(:client2)
  end

  test "Client should have a name, lastname and city" do
    assert_not @c1.save
  end

  test "capitalize_fields should return client's name, lastname and city capitalized" do
    @c2.capitalize_fields
    assert_equal("Andres", @c2.name)
    assert_equal("Acevedo", @c2.lastname)
    assert_equal("Barranca", @c2.city)
  end

  test "Client's city must be saved capitalized" do
    @c2.save
    assert_equal("Barranca", @c2.city)
  end
end
