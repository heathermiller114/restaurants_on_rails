class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_many :wishlists
    has_many :cities, through: :wishlists

end