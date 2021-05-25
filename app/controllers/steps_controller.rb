class StepsController < ApplicationController
    def destroy
        @steps = Steps.find(params[:id])
        @steps.destroy
        redirect_to @steps.recipe
    end
end
