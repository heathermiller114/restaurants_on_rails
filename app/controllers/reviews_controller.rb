class ReviewsController < ApplicationController

    def index
        #byebug
        @restaurant = Restaurant.find_by(id: params[:restaurant_id])
        if params[:review] == 'High to Low'
            @reviews = Review.high_to_low
        elsif params[:review] == 'Low to High'
            @reviews = Review.low_to_high
        else
            @reviews = @restaurant.reviews
        end
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