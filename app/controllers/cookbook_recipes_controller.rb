class CookbookRecipesController < ApplicationController

    before_action :set_cookbook_recipe, only: [:show, :edit, :update, :destroy]
    before_action :set_cookbook, only: [:create]

    def create
      @cookbook_recipe = CookbookRecipe.new(cookbook_recipe_params)
      @cookbook_recipe.cookbook = @cookbook
      if @cookbook_recipe.save
        redirect_to cookbook_path(@cookbook)
      else
        render '/cookbooks/show'
      end
    end


    def edit
    end

    def update
    end


    def destroy
        @cookbook_recipe.destroy
        redirect_to @cookbook_recipe.shopping_list
    end

    private

    def set_cookbook
        @cookbook = Cookbook.find(params[:cookbook_id])
    end

    def set_cookbook_recipe
        @cookbook_recipe = CookbookRecipe.find(params[:id])
    end

    def cookbook_recipe_params
        params.require(:cookbook_recipe).permit(:recipe_id)
    end

end
