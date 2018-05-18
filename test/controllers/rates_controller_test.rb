require 'test_helper'

class RatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rate = rates(:one)
  end

  test "should get index" do
    get rates_url, as: :json
    assert_response :success
  end

  test "should create rate" do
    assert_difference('Rate.count') do
      post rates_url, params: { rate: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show rate" do
    get rate_url(@rate), as: :json
    assert_response :success
  end

  test "should update rate" do
    patch rate_url(@rate), params: { rate: {  } }, as: :json
    assert_response 200
  end

  test "should destroy rate" do
    assert_difference('Rate.count', -1) do
      delete rate_url(@rate), as: :json
    end

    assert_response 204
  end
end
