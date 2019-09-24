class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text
  belongs_to :user, serializer: UserSerializer
  belongs_to :post, serializer: PostSerializer
end
