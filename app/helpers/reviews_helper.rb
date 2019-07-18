module ReviewsHelper

    def show_reviews(reviews, restaurant)
        if @reviews == []
            render partial: "empty", locals: { restaurant: @restaurant }
        else
            render partial: "reviews", locals: { reviews: @reviews }
        end
    end

end