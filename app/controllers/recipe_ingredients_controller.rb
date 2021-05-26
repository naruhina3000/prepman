class RecipeIngredientsController < ApplicationController
    before_action :set_recipe_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :set_recipe, only: [:index, :create]

    def index
        @recipe_ingredients = @recipe.recipe_ingredients
        @recipe_ingredient = RecipeIngredient.new
    end
    
    def create
        @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
        @recipe_ingredient.recipe = @recipe
        if @recipe_ingredient.save
            redirect_to recipe_recipe_ingredients_path(@recipe)
        else
         render "recipe_ingredients/index"
        end
    end
    
    def edit
    end 
    
    def update
    end


    def destroy
        @recipe_ingredient = RecipeIngredient.find(params[:id])
        @recipe_ingredient.destroy
        redirect_to request.referer
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id]) 
    end

    def set_recipe_ingredient
        @recipe_ingredient = RecipeIngredient.find(params[:id])
    end

    def recipe_ingredient_params
        params.require(:recipe_ingredient).permit(:quantity, :unit, :ingredient_id)
    end
end
