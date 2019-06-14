class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant

    validates :content, presence: true, length: { maximum: 500 }
end