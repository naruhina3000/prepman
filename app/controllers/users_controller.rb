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


    def self.find_for_facebook_oauth(auth)
      user_params = auth.slice("provider", "uid")
      user_params.merge! auth.info.slice("email", "first_name", "last_name")
      user_params[:facebook_picture_url] = auth.info.image
      user_params[:token] = auth.credentials.token
      user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
      user_params = user_params.to_h
  
      user = User.find_by(provider: auth.provider, uid: auth.uid)
      user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
      if user
        user.update(user_params)
      else
        user = User.new(user_params)
        user.password = Devise.friendly_token[0,20]  # Fake password for validation
        user.save
      end
  
      return user
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

