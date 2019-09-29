require 'test_helper'

class Front::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get front_contacts_index_url
    assert_response :success
  end

  test "should get create" do
    get front_contacts_create_url
    assert_response :success
  end

end
