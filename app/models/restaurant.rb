class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :city
    has_many :wishlists

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    accepts_nested_attributes_for :city

    def self.search(search)
        if search
            city = City.find_by(name: search)
            if city
                self.where(city_id: city)
            else
                Restaurant.all
            end
        else
            Restaurant.all
        end
    end
end