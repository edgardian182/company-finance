require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest

  test "should get index, an admin user is required" do
    sign_in users(:admin)  # Devise::Test::IntegrationHelpers method
    get clients_path
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should create a client" do
    sign_in users(:admin)
    assert_difference "Client.count" do
      post clients_path, params: {client: {name: "Rosa", lastname: "Acevedo", city: "Zapatoca" } }
    end
    assert_redirected_to clients_path
  end

end