class Post < ApplicationRecord
    belongs_to :user
    has_many :comments

    validates :title, length: {maximum: 250}
    validates :title, presence: true
    validates :content, presence: true
end
