require 'test_helper'

class ApplicationRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @application_record = application_records(:one)
  end

  test "should get index" do
    get application_records_url, as: :json
    assert_response :success
  end

  test "should create application_record" do
    assert_difference('ApplicationRecord.count') do
      post application_records_url, params: { application_record: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show application_record" do
    get application_record_url(@application_record), as: :json
    assert_response :success
  end

  test "should update application_record" do
    patch application_record_url(@application_record), params: { application_record: {  } }, as: :json
    assert_response 200
  end

  test "should destroy application_record" do
    assert_difference('ApplicationRecord.count', -1) do
      delete application_record_url(@application_record), as: :json
    end

    assert_response 204
  end
end
