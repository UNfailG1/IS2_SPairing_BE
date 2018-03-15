require 'test_helper'

class SponsorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get sponsors_url, as: :json
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post sponsors_url, params: { sponsor: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show sponsor" do
    get sponsor_url(@sponsor), as: :json
    assert_response :success
  end

  test "should update sponsor" do
    patch sponsor_url(@sponsor), params: { sponsor: {  } }, as: :json
    assert_response 200
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete sponsor_url(@sponsor), as: :json
    end

    assert_response 204
  end
end
