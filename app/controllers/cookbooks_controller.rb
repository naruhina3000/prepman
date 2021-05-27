class CookbooksController < ApplicationController
    before_action :set_cookbook, only: [:show, :destroy, :edit, :update, :publish]
  
    def index
      @cookbooks = current_user.cookbooks
      @cookbook = Cookbook.new
    end
  
    def show
      @user = @cookbook.user
      @cookbook_recipes = @cookbook.cookbook_recipes
    end
  
    def create
      @cookbook = Cookbook.new(cookbook_params)
      @cookbook.user = current_user
      if @cookbook.save
        redirect_to @cookbook
      else
        render "/"
      end
    end

    def edit
    end

    def update
      if @cookbook.update(cookbook_params)
          redirect_to cookbook_path(@cookbook)
      else
        render "edit"
      end
    end
  
    def destroy
      @cookbook.destroy
      redirect_to cookbooks_path
    end

    def publish
      @cookbook.update(status: "public")
      redirect_to request.referer
    end
  
    private
  
    def cookbook_params
      params.require(:cookbook).permit(:title, :status)
    end
  
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end
    
end
