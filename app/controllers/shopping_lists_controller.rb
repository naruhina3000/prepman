class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :destroy]


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
    @shopping_lists = current_user.shopping_lists
    @shopping_list_ingredient = ShoppingListIngredient.new
    @shopping_list_ingredients = @shopping_list.shopping_list_ingredients
  end


  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    @shopping_list.user = current_user
    if @shopping_list.save
      redirect_to @shopping_list
    else
      render "/"
    end
  end

  def destroy
    @shopping_list.destroy
    redirect_to shopping_lists_path
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:title)
  end

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

end
