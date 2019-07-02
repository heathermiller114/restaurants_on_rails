class ReviewsController < ApplicationController

    def index

    end

    def new
        #byebug
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        @review = @restaurant.reviews.build
    end

    def create
        #byebug
        @restaurant = Restaurant.find_by(id: review_params[:restaurant_id])
        @review = Review.create(review_params)
        if @review.save
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