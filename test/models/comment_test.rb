require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:one)
  end

  test 'comment has a user' do
    assert @comment.user_id, 'Comment does not have a user'
  end

  test 'comment has a post' do
    assert @comment.post_id, 'Comment does not have a post'
  end

  test 'comment has text' do
    assert @comment.text, 'Comment does not have text'
  end

  test 'comment should not save without a user' do
    user = User.create(username: 'test', password: '123', avatar_url: 'http://example.com')
    post = Post.create(content: 'foo', title: 'bar', user: user)
    comment = Comment.new(text: '123', post: post)
    assert !comment.save, 'Comment was saved without a user'
  end

  test 'comment should not save without a post' do
    user = User.create(username: 'test', password: '123', avatar_url: 'http://example.com')
    post = Post.create(content: 'foo', title: 'bar', user: user)
    comment = Comment.new(text: '123', user: user)
    assert !comment.save, 'Comment was saved without a post'
  end
end
