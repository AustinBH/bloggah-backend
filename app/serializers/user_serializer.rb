class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :posts, :comments

    def posts
    self.object.posts.map do |post|
      {id: post.id}
    end
  end
  def comments
    self.object.comments.map do |comment|
      {id: comment.id}
    end
  end
end
