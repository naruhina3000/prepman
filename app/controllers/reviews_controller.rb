class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      redirect_to @recipe
    else
      @planner = Planner.new
      @shopping_list = ShoppingList.new
      render 'recipes/show'
    end
  end


  private

  def review_params
    params.require(:review).permit(:rating, :content, :reply)
  end
end
