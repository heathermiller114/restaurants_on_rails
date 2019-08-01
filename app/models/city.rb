class City < ApplicationRecord
    has_many :restaurants
    has_many :wishlists

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    scope :most_restaurants, -> { City.left_joins(:restaurants).group(:city_id).order('COUNT(restaurants.id) DESC').limit(1) }

end