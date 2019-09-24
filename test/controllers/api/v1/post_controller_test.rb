require 'test_helper'

class Api::V1::PostControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test "should not create post with no user" do
    assert_difference('Post.count', 0) do
      post '/api/v1/post', params: { post: { title: 'test', content: '123' } }, as: :json
    end

    assert_response 406
  end

  test "should create post" do
    assert_difference('Post.count', 1) do
      post '/api/v1/post', params: { post: { title: 'test', content: '123', user_id: 1 } }, as: :json
    end
    
    assert_response 201
  end

  test "should see all posts" do
    get '/api/v1/post', as: :json
    assert_response 200
  end

  test "should see one post" do
    get '/api/v1/post/1', as: :json
    assert_response 200
  end

  test "should update post" do
    patch '/api/v1/post/1', params: { post: { title: 'test1', content: '123', user_id: 1 } }, as: :json
    assert_response 202
  end

  test "should delete post" do
    delete '/api/v1/post/1', params: { post: { id: @post.id } }, as: :json
    assert_response 204
  end
end
