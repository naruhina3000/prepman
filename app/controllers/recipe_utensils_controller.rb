class RecipeUtensilsController < ApplicationController
    def destroy
        @recipe_utensil = RecipeUtensil.find(params[:id])
        @recipe_utensil.destroy
        redirect_to @recipe_utensil.recipe
    end
end
