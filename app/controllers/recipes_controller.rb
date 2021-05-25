class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @planner = Planner.new
  end

  def update

  end

  def edit
  end

  def new
    @recipe = Recipe.new

  end

  def create
  end

  def destroy
    @recipe.photos.purge
    @recipe.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
