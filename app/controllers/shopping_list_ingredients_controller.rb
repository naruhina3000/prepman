class ShoppingListIngredientsController < ApplicationController
   # resources :shopping_list_ingredients, only: [:create, :destroy]

    before_action :set_shopping_list_ingredient, only: [:show, :edit, :update, :destroy]
    before_action :set_shopping_list, only: [:create]

    # def index
    #     @recipe_ingredients = @recipe.recipe_ingredients
    #     @recipe_ingredient = RecipeIngredient.new
    # end

    def create
      @shopping_list_ingredient = ShoppingListIngredient.new(shopping_list_ingredient_params)
      @shopping_list_ingredient.shopping_list = @shopping_list
      if @shopping_list_ingredient.save
        redirect_to shopping_list_path(@shopping_list)
      else
        render '/shopping_lists/show'
      end
    end


    def edit
    end

    def update
    end


    def destroy
        @shopping_list_ingredient.destroy
        redirect_to @shopping_list_ingredient.shopping_list
    end

    private

    def set_shopping_list
        @shopping_list = ShoppingList.find(params[:shopping_list_id])
    end

    def set_shopping_list_ingredient
        @shopping_list_ingredient = ShoppingListIngredient.find(params[:id])
    end

    def shopping_list_ingredient_params
        params.require(:shopping_list_ingredient).permit(:quantity, :unit, :ingredient_id)
    end
end


