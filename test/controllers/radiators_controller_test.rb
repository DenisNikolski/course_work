require 'test_helper'

class RadiatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get radiators_new_url
    assert_response :success
  end

  test "should get create" do
    get radiators_create_url
    assert_response :success
  end

  test "should get update" do
    get radiators_update_url
    assert_response :success
  end

  test "should get edit" do
    get radiators_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get radiators_destroy_url
    assert_response :success
  end

  test "should get index" do
    get radiators_index_url
    assert_response :success
  end

  test "should get show" do
    get radiators_show_url
    assert_response :success
  end

end
