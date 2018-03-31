require 'test_helper'

class GamePlatformsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_platform = game_platforms(:one)
  end

  test "should get index" do
    get game_platforms_url, as: :json
    assert_response :success
  end

  test "should create game_platform" do
    assert_difference('GamePlatform.count') do
      post game_platforms_url, params: { game_platform: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show game_platform" do
    get game_platform_url(@game_platform), as: :json
    assert_response :success
  end

  test "should update game_platform" do
    patch game_platform_url(@game_platform), params: { game_platform: {  } }, as: :json
    assert_response 200
  end

  test "should destroy game_platform" do
    assert_difference('GamePlatform.count', -1) do
      delete game_platform_url(@game_platform), as: :json
    end

    assert_response 204
  end
end
