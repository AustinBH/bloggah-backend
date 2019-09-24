require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'user has posts' do
    assert @user.posts, 'User does not have posts'
  end

  test 'user has comments' do
    assert @user.comments, 'User does not have comments'
  end

  test 'user has an avatar' do
    assert @user.avatar_url, 'User does not have an avatar url'
  end

  test 'user cannot be saved without a username' do
    user = User.new(password: '123', avatar_url: 'http://example.com')
    assert !user.save, 'User was saved without a username'
  end

  test 'user cannot be saved without a password' do
    user = User.new(username: 'test', avatar_url: 'http://example.com')
    assert !user.save, 'User was saved without a password'
  end

  test 'password must be at least 3 characters' do
    user = User.new(password: '1', username: 'test', avatar_url: 'http://example.com')
    assert !user.save, 'User was saved with a password less than 3 characters'
  end

  test 'user has a unique username' do
    user = User.new(username: 'test', password: '123', avatar_url: 'http://example.com')
    assert !user.save, 'User was saved with the same username as another user'
  end

end
