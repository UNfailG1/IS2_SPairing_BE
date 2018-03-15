require 'test_helper'

class SubForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_forum = sub_forums(:one)
  end

  test "should get index" do
    get sub_forums_url, as: :json
    assert_response :success
  end

  test "should create sub_forum" do
    assert_difference('SubForum.count') do
      post sub_forums_url, params: { sub_forum: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show sub_forum" do
    get sub_forum_url(@sub_forum), as: :json
    assert_response :success
  end

  test "should update sub_forum" do
    patch sub_forum_url(@sub_forum), params: { sub_forum: {  } }, as: :json
    assert_response 200
  end

  test "should destroy sub_forum" do
    assert_difference('SubForum.count', -1) do
      delete sub_forum_url(@sub_forum), as: :json
    end

    assert_response 204
  end
end
