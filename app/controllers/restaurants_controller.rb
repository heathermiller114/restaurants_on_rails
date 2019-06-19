class RestaurantsController < ApplicationController
    
    def index

    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_city
    end

    def create

    end

    private

        def restaurant_params
            params.require(:restaurant).permit(:name, :street_address, :genre, :city_id, city_attributes: [:name])
        end
end