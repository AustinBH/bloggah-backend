require 'test_helper'

class Api::V1::UserControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should not create user with the same name" do
    assert_difference('User.count', 0, 'That username is taken') do
      post '/api/v1/user', params: { user: { username: 'test', password: '123', avatar_url: 'https://www.example.com' } }, as: :json
    end
    
    assert_response 406
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post '/api/v1/user', params: { user: { username: 'test1', password: '123', avatar_url: 'https://www.example.com' } }, as: :json
    end
    
    assert_response 201
  end

  test "should see all users" do
    get '/api/v1/user', as: :json
    assert_response 200
  end

  test "should see one user" do
    get '/api/v1/user/1', as: :json
    assert_response 200
  end

  test "should update user" do
    patch '/api/v1/user/1', params: { user: { username: 'test1', password: '123', avatar_url: 'https://www.example.com' } }, as: :json
    assert_response 202
  end

  test "should delete user" do
    delete '/api/v1/user/1', params: { user: { password: '123' } }, as: :json
    assert_response 204
  end
end
