class RecipeIngredientsController < ApplicationController

    def destroy
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredient.destroy
        redirect_to @recipe_ingredient.recipe
    end
end
