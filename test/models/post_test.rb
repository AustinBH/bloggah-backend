require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:one)
  end

  test 'post has a user' do
    assert @post.user_id, 'Post does not have a user'
  end

  test 'post has comments' do
    assert @post.comments, 'Post does not have comments'
  end

  test 'post has content' do
    assert @post.content, 'Post does not have content'
  end

  test 'post has a title' do
    assert @post.title, 'Post does not have a title'
  end

  test 'post should not save without a user' do
    post = Post.new(content: 'foo', title: 'bar')
    assert !post.save, 'Post was saved without a user'
  end

  test 'post title should not exceed 250 characters' do
    user = User.create(username: 'test', password: '123', avatar_url: 'http://example.com')
    post = Post.new(content: 'foo', title: 'ausidbfkuyaisvdfajshdlfkgasjdlfkjabsdufhasdkjfnlbahsdfjkasdftfavousdfibasuydfausyebfouyabsdfuoasvdfuyasvodfuyabsvdfuyoabvsduoyfvasydufivaousydfbaisuldbfiuasbodufyasvdfajhsdkfalskjdfbhahsdfp;iayusdbfas;djbaslhjdfbkajsbdfyasihkf;asiyvdufhojlbkajsdfiuvyaulshdbfjiiausdfyh ajsindufbyvadhsjfnuabsyvudbhfiuasphdyfobuhasijnudofhpbayshdifjnoiasubdyfihjansdfhuiabsdjfniahsuipdbfyhjansoidfhubiasasdfyasdfasf', user: user)
    assert !post.save, 'Post was saved with a title longer than 250 characters'
  end
end
