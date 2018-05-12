require 'test_helper'

class PlayerReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_report = player_reports(:one)
  end

  test "should get index" do
    get player_reports_url, as: :json
    assert_response :success
  end

  test "should create player_report" do
    assert_difference('PlayerReport.count') do
      post player_reports_url, params: { player_report: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show player_report" do
    get player_report_url(@player_report), as: :json
    assert_response :success
  end

  test "should update player_report" do
    patch player_report_url(@player_report), params: { player_report: {  } }, as: :json
    assert_response 200
  end

  test "should destroy player_report" do
    assert_difference('PlayerReport.count', -1) do
      delete player_report_url(@player_report), as: :json
    end

    assert_response 204
  end
end
