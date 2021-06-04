class PlannersController < ApplicationController

  def index
    @planners = current_user.planners
  end

  def create
    @planner = Planner.new(planner_params)
    @recipe = Recipe.find(params[:planner][:recipe_id])
    @user = current_user
    @planner.recipe = @recipe
    @planner.user = @user
    if @planner.save
      redirect_to @recipe
    else
      @error = true
      flash[:alert] = "Recipe not added to your planner. Please choose a date to add the recipe to your planner"
      redirect_to @recipe
    end
  end

  def destroy
    @planner = Planner.find(params[:id])
    @planner.destroy
    redirect_to @planner
  end

  private

  def planner_params
    params.require(:planner).permit(:date)
  end
end
