require 'test_helper'

class AdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ad = ads(:one)
  end

  test "should get index" do
    get ads_url, as: :json
    assert_response :success
  end

  test "should create ad" do
    assert_difference('Ad.count') do
      post ads_url, params: { ad: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show ad" do
    get ad_url(@ad), as: :json
    assert_response :success
  end

  test "should update ad" do
    patch ad_url(@ad), params: { ad: {  } }, as: :json
    assert_response 200
  end

  test "should destroy ad" do
    assert_difference('Ad.count', -1) do
      delete ad_url(@ad), as: :json
    end

    assert_response 204
  end
end
