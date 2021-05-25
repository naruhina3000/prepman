class RecipeIngredientsController < ApplicationController
    before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :set_recipe, only: [:index, :create]

    def index
        @recipe_ingredients = @recipe.recipe_ingredients
        @recipe_ingredient = RecipeIngredient.new
    end
    
    def create

    end
    
    def edit
    end 
    
    def update
    end


    def destroy
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredient.destroy
        redirect_to @recipe_ingredient.recipe
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id]) 
    end

    def set_recipe_ingredient
        @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:quantity, :unit)
    end
end
