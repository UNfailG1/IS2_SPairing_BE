require 'test_helper'

class ValidateSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get validate" do
    get validate_session_validate_url
    assert_response :success
  end

end
