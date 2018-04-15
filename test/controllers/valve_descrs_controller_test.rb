require 'test_helper'

class ValveDescrsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get valve_descrs_new_url
    assert_response :success
  end

  test "should get create" do
    get valve_descrs_create_url
    assert_response :success
  end

  test "should get update" do
    get valve_descrs_update_url
    assert_response :success
  end

  test "should get edit" do
    get valve_descrs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get valve_descrs_destroy_url
    assert_response :success
  end

  test "should get index" do
    get valve_descrs_index_url
    assert_response :success
  end

  test "should get show" do
    get valve_descrs_show_url
    assert_response :success
  end

end
