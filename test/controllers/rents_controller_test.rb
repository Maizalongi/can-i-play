require "test_helper"

class RentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get rents_new_url
    assert_response :success
  end

  test "should get create" do
    get rents_create_url
    assert_response :success
  end

  test "should get my_rents" do
    get rents_my_rents_url
    assert_response :success
  end

  test "should get edit" do
    get rents_edit_url
    assert_response :success
  end

  test "should get update" do
    get rents_update_url
    assert_response :success
  end

  test "should get destroy" do
    get rents_destroy_url
    assert_response :success
  end

  test "should get index" do
    get rents_index_url
    assert_response :success
  end

  test "should get show" do
    get rents_show_url
    assert_response :success
  end
end
