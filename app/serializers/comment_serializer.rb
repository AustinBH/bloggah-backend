class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :post

  def user
    {id: object.user.id, username: object.user.username}
  end

  def post
    {id: object.post.id, title: object.post.title}
  end
end
