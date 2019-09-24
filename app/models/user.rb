class User < ApplicationRecord
    has_many :posts
    has_many :comments

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :avatar_url, presence: true
    validates :password, length: {minimum: 3}

    has_secure_password
end
