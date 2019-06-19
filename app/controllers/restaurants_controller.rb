class RestaurantsController < ApplicationController
    
    def index

    end

    def new
        @restaurant = Restaurant.new
        @restaurant.build_city
    end

    def create

    end
end