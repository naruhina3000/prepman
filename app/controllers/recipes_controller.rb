class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_shopping_list]

  def index
    @recipes = Recipe.all
    # @recipes = Recipe.where(category: "publihed")
  end

  def show
    @planner = Planner.new
    @shopping_list = ShoppingList.new
  end

  def update

  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user
    if @recipe.save
      redirect_to recipe_recipe_ingredients_path(@recipe)
    else
     render 'new'
    end
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
    @recipe.photos.purge
    @recipe.destroy
    redirect_to user_path(current_user)
  end


  def add_to_shopping_list
    @shopping_list = ShoppingList.find(params[:list])
    @recipe.recipe_ingredients.each do |recipe_ingredient|
      ShoppingListIngredient.create(shopping_list: @shopping_list, recipe: @recipe, ingredient: recipe_ingredient.ingredient, quantity: recipe_ingredient.quantity, unit: recipe_ingredient.unit)
    end
    redirect_to request.referer
    flash[:success] = "All the ingredients have been added to your shopping list"
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :portion, :difficulty, :prep_time, :bake_time,
    :resting_time, :diet, :dish_type, :cuisine, :occasion, :calories, :protein, :fat, :carb, :photo)
  end
end

