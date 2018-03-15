require 'test_helper'

class ThreadForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thread_forum = thread_forums(:one)
  end

  test "should get index" do
    get thread_forums_url, as: :json
    assert_response :success
  end

  test "should create thread_forum" do
    assert_difference('ThreadForum.count') do
      post thread_forums_url, params: { thread_forum: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show thread_forum" do
    get thread_forum_url(@thread_forum), as: :json
    assert_response :success
  end

  test "should update thread_forum" do
    patch thread_forum_url(@thread_forum), params: { thread_forum: {  } }, as: :json
    assert_response 200
  end

  test "should destroy thread_forum" do
    assert_difference('ThreadForum.count', -1) do
      delete thread_forum_url(@thread_forum), as: :json
    end

    assert_response 204
  end
end
