require 'test_helper'

class ValvesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get valves_new_url
    assert_response :success
  end

  test "should get create" do
    get valves_create_url
    assert_response :success
  end

  test "should get update" do
    get valves_update_url
    assert_response :success
  end

  test "should get edit" do
    get valves_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get valves_destroy_url
    assert_response :success
  end

  test "should get index" do
    get valves_index_url
    assert_response :success
  end

  test "should get show" do
    get valves_show_url
    assert_response :success
  end

end
