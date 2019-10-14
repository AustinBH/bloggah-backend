class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user, :comments

  def user
    {id: object.user.id, username: object.user.username}
  end
  def comments
    self.object.comments.map do |comment|
      {id: comment.id, text: comment.text}
    end
  end
end
