require 'test_helper'

class ScreenshotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @screenshot = screenshots(:one)
  end

  test "should get index" do
    get screenshots_url, as: :json
    assert_response :success
  end

  test "should create screenshot" do
    assert_difference('Screenshot.count') do
      post screenshots_url, params: { screenshot: { game_id: @screenshot.game_id, scr_height: @screenshot.scr_height, scr_url: @screenshot.scr_url, scr_width: @screenshot.scr_width } }, as: :json
    end

    assert_response 201
  end

  test "should show screenshot" do
    get screenshot_url(@screenshot), as: :json
    assert_response :success
  end

  test "should update screenshot" do
    patch screenshot_url(@screenshot), params: { screenshot: { game_id: @screenshot.game_id, scr_height: @screenshot.scr_height, scr_url: @screenshot.scr_url, scr_width: @screenshot.scr_width } }, as: :json
    assert_response 200
  end

  test "should destroy screenshot" do
    assert_difference('Screenshot.count', -1) do
      delete screenshot_url(@screenshot), as: :json
    end

    assert_response 204
  end
end
