class ReviewsController < ApplicationController
  before_action :set_restaurant

  def new
    @review = Review.new
  end

  def create
    @review = @restaurant.reviews.new(review_params)
    @review.save
    redirect_to restaurants_path
  end

private

  def set_restaurant
    @restaurant = Restaurant.find_by(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
