class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]


  resources :shopping_list, only: [:index, :create, :show, :destroy] do
    resources :shopping_list_ingredients, only: [:create, :destroy]
  end



  def index
    @shopping_lists = current_user.shopping_lists
  end



def create
    @shopping_list = ShoppingList.new(planner_params)
    @recipe = Recipe.find(params[:planner][:recipe_id])
    @user = current_user
    @planner.recipe = @recipe
    @planner.user = @user
    if @planner.save
      redirect_to @recipe
    else
      render "/recipes/show"
    end
  end

  def destroy
    @planner = Planner.find(params[:id])
    @planner.destroy
    redirect_to @planner
  end

  private

  def shopping_list__params
    params.require(:shopping_list).permit(:title)
  end

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

end
