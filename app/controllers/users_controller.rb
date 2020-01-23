class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
        redirect_to user_path(@user.id)
        else
        flash[:errors] = @user.errors.full_messages
        end
    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :bio)
    end


end
