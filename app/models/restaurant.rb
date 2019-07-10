class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    belongs_to :city
    has_many :wishlists

    validates :name, presence: true
    validate :not_the_same

    def not_the_same
        if Restaurant.find_by(name: name, street_address: street_address)
            errors.add(:street_address, "has already been added for this restaurant.")
        end
    end

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

    def city_attributes=(city)
        self.city = City.find_or_create_by(id: city_id)
        self.city.update(city)
    end

end