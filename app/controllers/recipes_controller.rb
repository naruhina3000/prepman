class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy, :add_to_shopping_list, :add_to_cookbook, :publish]

  def index
    # @recipes = Recipe.all
    if params[:query].present?
      @recipes = Recipe.where('title ILIKE ?', "%#{params[:query]}%")
    else
      @recipes = Recipe.where(status: "published")
    end
  end

  def show
    @planner = Planner.new
    @shopping_list = ShoppingList.new
    @cookbook = Cookbook.new
    @review = Review.new
    @user = @recipe.user
  end

  def update
    if @recipe.update(recipe_params)
       @recipe.update(status: "draft")
      redirect_to recipe_recipe_ingredients_path(@recipe)
    else
      render "edit"
    end
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
    # if @recipe.photo
    @recipe.photo.purge
    # end
    @recipe.destroy
    redirect_to user_path(current_user)
  end


  def add_to_shopping_list
    if params[:new_list].present?
      @shopping_list = ShoppingList.create(title: params[:new_list], user:current_user)
    else
      @shopping_list = ShoppingList.find(params[:list])
    end
    @recipe.recipe_ingredients.each do |recipe_ingredient|
      ShoppingListIngredient.create(shopping_list: @shopping_list, recipe: @recipe, ingredient: recipe_ingredient.ingredient, quantity: recipe_ingredient.quantity, unit: recipe_ingredient.unit)
    end
    redirect_to request.referer
    flash[:success] = "All the ingredients have been added to your shopping list"
  end


  def add_to_cookbook
    if params[:new_cookbook_list].present?
      @cookbook = Cookbook.create(title: params[:new_cookbook_list], user:current_user)
    else
      @cookbook = Cookbook.find(params[:cookbook_list])
    end
    CookbookRecipe.create(cookbook: @cookbook, recipe: @recipe)
    redirect_to request.referer
    flash[:success] = "Your recipe was added to your #{@cookbook.title}"
  end

  def publish
    @recipe.update(status: "published")
    redirect_to request.referer
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

