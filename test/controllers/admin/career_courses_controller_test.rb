require 'test_helper'

class Admin::CareerCoursesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_career_courses_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_career_courses_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_career_courses_edit_url
    assert_response :success
  end

end
