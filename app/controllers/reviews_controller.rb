class ReviewsController < ApplicationController

    def index
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        @reviews = @restaurant.reviews
    end

    def new
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        @review = @restaurant.reviews.build
    end

    def create
        #byebug
        @restaurant = Restaurant.find_by(id: review_params[:restaurant_id])
        @review = current_user.reviews.build(review_params)
        if @review.save!
            #byebug
            redirect_to restaurant_reviews_path(@restaurant)
        else
            render :new
        end
    end

    private

    def review_params
        params.require(:review).permit(:title, :content, :star_rating, :restaurant_id)
    end

end