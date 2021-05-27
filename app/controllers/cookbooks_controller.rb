class CookbooksController < ApplicationController

    before_action :set_cookbook, only: [:show, :destroy]


    # resources :cookbook, only: [:index, :create, :show, :destroy] do
    #   resources :cookbook_ingredients, only: [:create, :destroy]
    # end
  
  
    def index
      @cookbooks = current_user.cookbooks
      @cookbook = Cookbook.new
    end
  
    def new
      @cookbook = Cookbook.new
    end
  
    def show
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
  
    def destroy
      @cookbook.destroy
      redirect_to cookbooks_path
    end
  
    private
  
    def cookbook_params
      params.require(:cookbook).permit(:title)
    end
  
    def set_cookbook
      @cookbook = Cookbook.find(params[:id])
    end
    
end
