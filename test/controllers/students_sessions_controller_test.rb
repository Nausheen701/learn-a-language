require "test_helper"

class StudentsSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get students_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get students_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get students_sessions_destroy_url
    assert_response :success
  end
end
