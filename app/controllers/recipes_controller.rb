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

  def create
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user
    if @recipe.save
      redirect_to recipe_steps_path(@recipe)
    else
     render 'new'
    end

  def new
    @recipe = Recipe.new
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

  def recipe_params
    params.require(:recipe).permit(:title, :description, :portion, :difficulty, :prep_time, :bake_time,
    :resting_time, :diet, :dish_type, :cuisine, :occasion, :calories, :protein, :fat, :carb, :photo)
  end
end

