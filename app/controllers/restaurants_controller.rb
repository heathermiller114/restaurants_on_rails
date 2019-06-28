class RestaurantsController < ApplicationController
    
    def index
        @restaurants = Restaurant.search(params[:search])
    end

    def new
        @restaurant = Restaurant.new
        #byebug
        @restaurant.build_city
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.build_city(id: params[:restaurant][:city_id])
        #something is wrong with collection_select
        byebug
        if @restaurant.save!
            redirect_to restaurant_path(@restaurant)
        else
            @restaurant.build_city
            render :new
        end
    end

    def show
        @restaurant = Restaurant.find_by(id: params[:id])
    end

    private

        def restaurant_params
            params.require(:restaurant).permit(:name, :street_address, :genre, :city_id, :search, city_attributes: [:name])
        end
end