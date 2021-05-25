class RecipeUtensilsController < ApplicationController
    before_action :set_recipe_utensil, only: [:show, :edit, :update, :destroy]
    before_action :set_recipe, only: [:index, :create]

    def index
        @recipe_utensils = @recipe.recipe_utensils
        @recipe_utensil = RecipeUtensil.new
    end
    
    def create

    end
    
    def edit
    end 
    
    def update
    end


    def destroy
        @recipe_utensil = RecipeUtensil.find(params[:id])
        @recipe_utensil.destroy
        redirect_to @recipe_utensil.recipe
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id]) 
    end

    def set_recipe_utensil
        @recipe_utensil = RecipeUtensil.find(params[:id])
    end

    def recipe_utensil_params
        params.require(:recipe_utensil).permit(:quantity)
    end
end
