class ReviewsController < ApplicationController

    def index

    end

    def new
        #byebug
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        @review = @restaurant.reviews.build
    end

    def create

    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :star_rating, :restaurant_id)
    end

end