require 'test_helper'

class PlayerBlackListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_black_list = player_black_lists(:one)
  end

  test "should get index" do
    get player_black_lists_url, as: :json
    assert_response :success
  end

  test "should create player_black_list" do
    assert_difference('PlayerBlackList.count') do
      post player_black_lists_url, params: { player_black_list: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show player_black_list" do
    get player_black_list_url(@player_black_list), as: :json
    assert_response :success
  end

  test "should update player_black_list" do
    patch player_black_list_url(@player_black_list), params: { player_black_list: {  } }, as: :json
    assert_response 200
  end

  test "should destroy player_black_list" do
    assert_difference('PlayerBlackList.count', -1) do
      delete player_black_list_url(@player_black_list), as: :json
    end

    assert_response 204
  end
end
