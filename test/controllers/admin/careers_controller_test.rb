require 'test_helper'

class Admin::CareersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_careers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_careers_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_careers_new_url
    assert_response :success
  end

  test "should get update" do
    get admin_careers_update_url
    assert_response :success
  end

end
