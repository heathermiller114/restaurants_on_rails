class City < ApplicationRecord
    has_many :restaurants
    has_many :wishlists

end