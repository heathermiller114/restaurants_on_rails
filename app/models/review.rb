class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :content, presence: true, length: { maximum: 500 }
    validates :star_rating, numericality: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 
end