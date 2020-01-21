class BasketsController < ApplicationController


    def show
        @show = Show.find(params[:id])
    end


end
