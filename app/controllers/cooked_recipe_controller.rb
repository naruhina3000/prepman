class CookedRecipeController < ApplicationController
  
  def index
    @cooked_recipes = CookedRecipe.where(user: current_user)
  end
  
  def create
    @cooked_recipe = CookedRecipe.new
    @recipe = Recipe.find(params[:recipe_id])
    @cooked_recipe.recipe = @recipe
    @cooked_recipe.user = current_user
    @cooked_recipe.save
    redirect_to request.referer
  end

  def destroy
    @cooked_recipe = CookedRecipe.find(params[:id])
    @cooked_recipe.destroy
    redirect_to request.referer
  end

end
