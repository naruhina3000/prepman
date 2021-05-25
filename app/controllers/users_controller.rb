class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show]

    def show
      @user = User.find(params[:id])
      # @followed_cookbooks = Followed_cookbooks.joins(:cookbook_recipes.where(cookbook_recipesuser: @user)
      @followed_cookbook = FollowedCookbook.where(user: @user)
      @cooked_recipes = CookedRecipe.where(user: @user)
      @likes = Favorite.where(user: @user)
      @recipes = Recipe.where(user: @user)
      @cookbooks = Cookbook.where(user: @user)
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])

      if @user.update(user_params)
        redirect_to @user
      else
        render "edit"
      end
    end

    private

    def user_params
      params.require(:user).permit(:username, :name, :url, :bio, :photo)
    end

end
