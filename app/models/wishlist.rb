class Wishlist < ApplicationRecord
    belongs_to :city
    belongs_to :user
    belongs_to :restaurant

end