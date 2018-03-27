require 'test_helper'

class PlayerWhiteListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_white_list = player_white_lists(:one)
  end

  test "should get index" do
    get player_white_lists_url, as: :json
    assert_response :success
  end

  test "should create player_white_list" do
    assert_difference('PlayerWhiteList.count') do
      post player_white_lists_url, params: { player_white_list: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show player_white_list" do
    get player_white_list_url(@player_white_list), as: :json
    assert_response :success
  end

  test "should update player_white_list" do
    patch player_white_list_url(@player_white_list), params: { player_white_list: {  } }, as: :json
    assert_response 200
  end

  test "should destroy player_white_list" do
    assert_difference('PlayerWhiteList.count', -1) do
      delete player_white_list_url(@player_white_list), as: :json
    end

    assert_response 204
  end
end
