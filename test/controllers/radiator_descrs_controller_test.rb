require 'test_helper'

class RadiatorDescrsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get radiator_descrs_new_url
    assert_response :success
  end

  test "should get create" do
    get radiator_descrs_create_url
    assert_response :success
  end

  test "should get update" do
    get radiator_descrs_update_url
    assert_response :success
  end

  test "should get edit" do
    get radiator_descrs_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get radiator_descrs_destroy_url
    assert_response :success
  end

  test "should get index" do
    get radiator_descrs_index_url
    assert_response :success
  end

  test "should get show" do
    get radiator_descrs_show_url
    assert_response :success
  end

end
