class User < ApplicationRecord
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_many :wishlists
    has_many :cities, through: :wishlists

    has_secure_password

    validates :password, length: { minimum: 8 }
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

    VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL }, uniqueness: { case_sensitive: false }



    def self.create_user_from_google(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.username = auth[:info][:name]
        end

    end
end