class City < ApplicationRecord
    has_many :restaurants
    has_many :wishlists

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end