class BasketsController < ApplicationController


    def my_basket
        @basket = @logged_in_user.basket_origamis
        if @basket.size > 0 
            @recommended = @logged_in_user.get_reccommended_origami
        end

    end


end
