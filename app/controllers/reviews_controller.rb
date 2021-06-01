class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to recipe_path(@recipe, anchor:"review-#{@review.id}")
    else
      @planner = Planner.new
      @shopping_list = ShoppingList.new
      redirect_to new_user_session_path
      # render 'recipes/show'
      # render recipe_path(@recipe, anchor:"review-#{@review.id}")
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content, :photo)
  end
end
