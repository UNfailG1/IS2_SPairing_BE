require 'test_helper'

class ThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thread = threads(:one)
  end

  test "should get index" do
    get threads_url, as: :json
    assert_response :success
  end

  test "should create thread" do
    assert_difference('Thread.count') do
      post threads_url, params: { thread: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show thread" do
    get thread_url(@thread), as: :json
    assert_response :success
  end

  test "should update thread" do
    patch thread_url(@thread), params: { thread: {  } }, as: :json
    assert_response 200
  end

  test "should destroy thread" do
    assert_difference('Thread.count', -1) do
      delete thread_url(@thread), as: :json
    end

    assert_response 204
  end
end
