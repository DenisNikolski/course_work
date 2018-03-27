require 'test_helper'

class PipesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pipes_new_url
    assert_response :success
  end

  test "should get create" do
    get pipes_create_url
    assert_response :success
  end

  test "should get update" do
    get pipes_update_url
    assert_response :success
  end

  test "should get edit" do
    get pipes_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get pipes_destroy_url
    assert_response :success
  end

  test "should get index" do
    get pipes_index_url
    assert_response :success
  end

  test "should get show" do
    get pipes_show_url
    assert_response :success
  end

end
