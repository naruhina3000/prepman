class FollowedCookbooksController < ApplicationController

  def index
    @followed_cookbooks = FollowedCookbook.where(user: current_user)
  end

    def create
        @followed_cookbook = FollowedCookbook.new
        @cookbook = Cookbook.find(params[:cookbook_id])
        @followed_cookbook.cookbook = @cookbook
        @followed_cookbook.user = current_user
        @followed_cookbook.save
        redirect_to request.referer
      end
    
      def destroy
        @followed_cookbook = FollowedCookbook.find(params[:id])
        @followed_cookbook.destroy
        redirect_to request.referer
      end
end
