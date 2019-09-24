require 'test_helper'

class Api::V1::CommentControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should not create comment with no user" do
    assert_difference('Comment.count', 0) do
      post '/api/v1/comment', params: { comment: { text: 'test', post_id: 1 } }, as: :json
    end

    assert_response 406
  end

  test "should create comment" do
    assert_difference('Comment.count', 1) do
      post '/api/v1/comment', params: { comment: { text: 'test', post_id: 1, user_id: 1 } }, as: :json
    end
    
    assert_response 201
  end

  test "should see all comments" do
    get '/api/v1/comment', as: :json
    assert_response 200
  end

  test "should see one comment" do
    get '/api/v1/comment/1', as: :json
    assert_response 200
  end

  test "should update comment" do
    patch '/api/v1/comment/1', params: { comment: { text: 'test1', post_id: 1, user_id: 1 } }, as: :json
    assert_response 202
  end

  test "should delete comment" do
    delete '/api/v1/comment/1', params: { comment: { id: @comment.id } }, as: :json
    assert_response 204
  end
end
