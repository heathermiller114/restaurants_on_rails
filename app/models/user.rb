class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_many :wishlists
    has_many :cities, through: :wishlists

    has_secure_password

    validates :password, length: { minimum: 8 }
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }


end