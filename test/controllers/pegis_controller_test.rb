require 'test_helper'

class PegisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pegi = pegis(:one)
  end

  test "should get index" do
    get pegis_url, as: :json
    assert_response :success
  end

  test "should create pegi" do
    assert_difference('Pegi.count') do
      post pegis_url, params: { pegi: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show pegi" do
    get pegi_url(@pegi), as: :json
    assert_response :success
  end

  test "should update pegi" do
    patch pegi_url(@pegi), params: { pegi: {  } }, as: :json
    assert_response 200
  end

  test "should destroy pegi" do
    assert_difference('Pegi.count', -1) do
      delete pegi_url(@pegi), as: :json
    end

    assert_response 204
  end
end
