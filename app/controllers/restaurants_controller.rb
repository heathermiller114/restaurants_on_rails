class RestaurantsController < ApplicationController
    
    def index
        @user = current_user
        @restaurants = Restaurant.search(params[:search]).high_to_low_rating
    end

    def new
        @restaurant = Restaurant.new
        #byebug
        @restaurant.build_city
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        
        if @restaurant.save
            redirect_to restaurant_path(@restaurant)
        else
            @restaurant.build_city
            render :new
        end
    end

    def show
        @restaurant = Restaurant.find_by(id: params[:id])
    end

    def most
        @restaurant = Restaurant.most_reviewed[0]
    end

    private

        def restaurant_params
            params.require(:restaurant).permit(:name, :street_address, :genre, :city_id, :search, city_attributes: [:name])
        end
end