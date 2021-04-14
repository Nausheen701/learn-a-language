require "test_helper"

class ProgramControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get program_index_url
    assert_response :success
  end

  test "should get new" do
    get program_new_url
    assert_response :success
  end

  test "should get create" do
    get program_create_url
    assert_response :success
  end

  test "should get edit" do
    get program_edit_url
    assert_response :success
  end

  test "should get update" do
    get program_update_url
    assert_response :success
  end

  test "should get delete" do
    get program_delete_url
    assert_response :success
  end

  test "should get show" do
    get program_show_url
    assert_response :success
  end

  test "should get —no-test-framework" do
    get program_—no-test-framework_url
    assert_response :success
  end
end
