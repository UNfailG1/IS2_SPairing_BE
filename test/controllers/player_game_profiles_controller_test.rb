require 'test_helper'

class PlayerGameProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_game_profile = player_game_profiles(:one)
  end

  test "should get index" do
    get player_game_profiles_url, as: :json
    assert_response :success
  end

  test "should create player_game_profile" do
    assert_difference('PlayerGameProfile.count') do
      post player_game_profiles_url, params: { player_game_profile: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show player_game_profile" do
    get player_game_profile_url(@player_game_profile), as: :json
    assert_response :success
  end

  test "should update player_game_profile" do
    patch player_game_profile_url(@player_game_profile), params: { player_game_profile: {  } }, as: :json
    assert_response 200
  end

  test "should destroy player_game_profile" do
    assert_difference('PlayerGameProfile.count', -1) do
      delete player_game_profile_url(@player_game_profile), as: :json
    end

    assert_response 204
  end
end
