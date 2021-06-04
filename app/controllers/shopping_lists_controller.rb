class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:destroy, :destroy_all]


  # resources :shopping_list, only: [:index, :create, :show, :destroy] do
  #   resources :shopping_list_ingredients, only: [:create, :destroy]
  # end


  def index
    @shopping_lists = current_user.shopping_lists
    @shopping_list = ShoppingList.new
  end

  def new
    @shopping_list = ShoppingList.new
  end

  def show
    @shopping_list = ShoppingList.where(id: params[:id]).first
    @shopping_lists = current_user.shopping_lists
    @shopping_list_ingredient = ShoppingListIngredient.new
    @shopping_list_ingredients = @shopping_list&.shopping_list_ingredients
    @shopping_list_ingredients = @shopping_list_ingredients&.where(recipe_id: params[:recipe_id]) if params[:recipe_id].present?
  end


  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user = current_user
    if @shopping_list.save
      redirect_to @shopping_list
    else
      @error = true
      flash[:alert] = "Shopping list not created. Title cannot be blank."
      redirect_to @shopping_list
    end
  end

  def destroy
    @shopping_list.destroy
    redirect_to shopping_lists_path
  end


  def destroy_all
    if params[:recipe_id].present?
      @recipe = Recipe.find(params[:recipe_id])
      @shopping_list.shopping_list_ingredients.where(recipe_id: @recipe.id).destroy_all
    else
      @shopping_list.shopping_list_ingredients.destroy_all
    end
    redirect_to shopping_list_path(@shopping_list)

  end


  private

  def shopping_list_params
    params.require(:shopping_list).permit(:title)
  end

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

end
