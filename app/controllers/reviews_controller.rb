class ReviewsController < ApplicationController


  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@recipe, anchor:"review-#{@review.id}")
    # elsif @user_signed_in?
    #   flash[:alert] = "Review cannot be created without a rating."
    #   redirect_to recipe_path(@recipe)
    #   # @error = true
    #   # @planner = Planner.new
    #   # @shopping_list = ShoppingList.new
    #   redirect_to new_user_session_path
    else
      flash[:alert] = "Review cannot be created without a rating."
      redirect_to recipe_path(@recipe)
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content, :photo)
  end
end
