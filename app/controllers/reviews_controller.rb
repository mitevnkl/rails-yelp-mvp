class ReviewsController < ApplicationController
    def new
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review = Review.new
    end

    def create
        @review = Review.new(params.require(:review).permit(:rating, :content))
        @restaurant = Restaurant.find(params[:restaurant_id])
        @review.restaurant = @restaurant

        if @review.save
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end
end
