class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :city
    has_many :wishlists

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end