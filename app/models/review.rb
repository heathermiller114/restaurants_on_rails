class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :content, presence: true, length: { maximum: 500 }
    validates_numericality_of :star_rating, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 5 

    scope :high_to_low, -> { order(star_rating: :desc) }
    scope :low_to_high, -> { order(star_rating: :asc) }

end