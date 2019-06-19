class RestaurantsController < ApplicationController
    
    def index

    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_city
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end

    private

        def restaurant_params
            params.require(:restaurant).permit(:name, :street_address, :genre, :city_id, city_attributes: [:name])
        end
end