class ReviewsController < ApplicationController
  def new
    skip_authorization
    @application = Application.find(params[:application_id])
    @favour = @application.favour
    @review = Review.new
  end

  def create
    @review = Review.new(review_strong_params)
    @application = Application.find(params[:application_id])
    @review.application_id = @application.id

    if @review.save
      redirect_to review_path(@application)
    else
      render :new
    end
  end
  # def destroy
  #   review = Review.find(params[:id])
  #   review.destroy
  #   redirect_to restaurant_path(review.restaurant_id)
  # end
  private

  def review_strong_params
    params.require(:review).permit(:content, :rating)
  end
end
