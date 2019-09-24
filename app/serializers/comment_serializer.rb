class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :user, :post

  def user
    {id: object.self.user.id, username: object.self.user.username}
  end

  def post
    {id: object.self.post.id, title: object.self.post.title}
  end
end
