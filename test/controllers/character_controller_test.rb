require 'test_helper'

class CharacterControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get character_new_url
    assert_response :success
  end

  test "should get edit" do
    get character_edit_url
    assert_response :success
  end

  test "should get list" do
    get character_list_url
    assert_response :success
  end

  test "should get remove" do
    get character_remove_url
    assert_response :success
  end

  test "should get create" do
    get character_create_url
    assert_response :success
  end

end
