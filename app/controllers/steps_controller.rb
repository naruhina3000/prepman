class StepsController < ApplicationController
before_action :set_step, only: [:show, :update, :edit, :destroy]
before_action :set_recipe, only: [:index, :create]

    def index
        @steps = @recipe.steps
        @step = Step.new
    end

    def create
        @steps = @recipe.steps
        @step = Step.new(step_params)
        @step.recipe = @recipe
        if @step.save
            redirect_to recipe_steps_path(@recipe)
        else
          @error = true
         render "steps/index"
        end
    end

    def edit
    end

    def update
        @recipe = @step.recipe
        if @step.update(step_params)
            redirect_to recipe_steps_path(@recipe)
        else
          render "steps/index"
        end
    end

    def destroy
        @step.photo.purge
        @step.destroy
        redirect_to request.referer
    end

    private

    def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
    end

    def set_step
        @step = Step.find(params[:id])
    end

    def step_params
        params.require(:step).permit(:number, :description, :photo)
    end
end
