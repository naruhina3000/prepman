class FollowedCookbooksController < ApplicationController
    def create
        @followed_cookbook = FollowedCookbooks.new
        @cookbook = Cookbook.find(params[:cookbook_id])
        @followed_cookbook.cookbook = @cookbook
        @followed_cookbook.user = current_user
        @followed_cookbook.save
        redirect_to request.referer
      end
    
      def destroy
        @followed_cookbook = Favorite.find(params[:id])
        @followed_cookbook.destroy
        redirect_to request.referer
      end
end
