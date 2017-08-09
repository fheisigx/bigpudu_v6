require 'test_helper'

class Admin::MasterCareersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_master_careers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_master_careers_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_master_careers_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_master_careers_edit_url
    assert_response :success
  end

end
