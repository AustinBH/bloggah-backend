class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :avatar_url, :posts, :comments

    def posts
    self.object.posts.map do |post|
      {id: post.id, title: post.title}
    end
  end
  def comments
    self.object.comments.map do |comment|
      {id: comment.id, text: comment.text}
    end
  end
end
