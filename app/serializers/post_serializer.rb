class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user

  def user
    {id: object.self.user.id, username: object.self.user.username}
  end
end
