class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user

  def user
    {id: object.user.id, username: object.user.username}
  end
end
