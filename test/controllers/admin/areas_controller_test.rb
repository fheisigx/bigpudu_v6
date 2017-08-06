require 'test_helper'

class Admin::AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_areas_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_areas_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_areas_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_areas_update_url
    assert_response :success
  end

end
