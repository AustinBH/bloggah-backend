require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  setup do
    @comment = comments(:one)
    @user = users(:one)
    @post = posts(:one)
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
    comment = Comment.new(text: '123', post: @post)
    assert !comment.save, 'Comment was saved without a user'
  end

  test 'comment should not save without a post' do
    comment = Comment.new(text: '123', user: @user)
    assert !comment.save, 'Comment was saved without a post'
  end

  test 'comment should not save without text' do
    comment = Comment.new(post: @post, user: @user)
    assert !comment.save, 'Comment was saved without a post'
  end

  test 'comment should not save with text longer than 500 characters' do
    text = 'aspidfbasodyufbasyudobfaiusdbfauisdbfiuasobdfiuoasbdfuiabsdfiubasdufbaosiudfbaiuosdbfiuasbdfiuabsduifbasuidfbasiudfbiuasbdfiuabsdfiubasdiufbasiudbfaiusdbfiuasbdfiuasbdfiuabsdfiubasduifbasiudfbasuidfbauisdbfiuasbdfiuasbdfuiabsdfuabsdfuioasbdfiubasudifbasuidfbaiusdbfiuasbdfiuasbdfiuabsdufiabsdfiuabsdufiasbdfiuasbdiufasbdiufabsudfbauisdfbasiudfbaiusdnfopawenfoi[wqmeioqnw pviuqwbvp0uqpweonfqiwpbueiqwoencpb iqwoefyipqbuwoine[qwbpiedvyuqwpieudoklajsdbofybiapusoidf[pubiawyvefbiuo[inawheufpiyvouawbipunoei[fjhp9uabsyodfiunoi[jash9udbiyfhjanosi[dfhuiabysdjnofi[jha9psbeufinoaw]j90eh[8fbupinoasmdj9]0hf[uabpsniodjf[h8asudiojf[ah89pusbdfinhpag7oyebovyuabsdyfuvblasipdfoybahlsiudfasdubfyoabps[pd]fj90[wniofmj09[ausidf]]]]]]]]]];nqwpebiucyvqweuoi'
    comment = Comment.new(text: text, user: @user, post: @post)
    assert !comment.save, 'Comment was saved with text longer than 500 characters'
  end
end
