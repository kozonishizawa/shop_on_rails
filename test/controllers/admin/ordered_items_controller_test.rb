require 'test_helper'

class Admin::OrderedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_ordered_items_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_ordered_items_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_ordered_items_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_ordered_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_ordered_items_destroy_url
    assert_response :success
  end

end
