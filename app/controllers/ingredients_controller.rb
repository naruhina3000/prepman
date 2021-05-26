class IngredientsController < ApplicationController

    def index
        @myingredients = Ingredient.all
        @myingredients = @myingredients.where("name ILIKE ?", "%#{params[:search]}%").first(15)
        respond_to do |format|
            format.json { render :partial => "ingredients/index.json" }
        end
    end
end
