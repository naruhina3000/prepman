class UsersController < ApplicationController
    skip_before_action :authenticate_user!, only: [:show]

    def show
      @user = User.find(params[:id])
      # @followed_cookbooks = Followed_cookbooks.joins(:cookbook_recipes.where(cookbook_recipesuser: @user)
      @followed_cookbooks = FollowedCookbook.where(user: @user)
      @cooked_recipes = CookedRecipe.where(user: @user)
      @favorites = Favorite.where(user: @user)
      @recipes = Recipe.where(user: @user)
      @cookbooks = Cookbook.where(user: @user)
      @public_cookbooks = Cookbook.where(user: @user, status: "public")
      @cookbook = Cookbook.new
      set_cookbook_followers
    end

    def edit
      @user = User.find(params[:id])
      # just a comment.
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

    def set_cookbook_followers
      @cookbooks = Cookbook.where(user: @user)
      @cookbook_followers = 0
      @cookbooks.each do |cookbook|
        @cookbook_followers += cookbook.followed_cookbooks.count
      end
      @cookbook_followers
    end

end

