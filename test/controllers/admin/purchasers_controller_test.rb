require 'test_helper'

class Admin::PurchasersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_purchasers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_purchasers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_purchasers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_purchasers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_purchasers_destroy_url
    assert_response :success
  end

end
