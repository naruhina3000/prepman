class FavoritesController < ApplicationController
  def create
    @favorite = Favorite.new
    @recipe = Recipe.find(params[:recipe_id])
    @favorite.recipe = @recipe
    @favorite.user = current_user
    @favorite.save
    redirect_to request.referer
    # redirect_to recipes_path(anchor: "recipe-#{@recipe.id}")
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to request.referer
  end

end
