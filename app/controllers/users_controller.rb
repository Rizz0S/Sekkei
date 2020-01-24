class UsersController < ApplicationController



    #-------------READ-------------#
    
    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @basket = @user.basket_origamis
    end

    #-------------CREATE-------------#

    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)

        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(user.id)
        else
            flash[:errors] = user.errors.full_messages
            redirect_to new_user_path
        end
    end

    #-------------LOGIN-------------#

    def login

        render :login
    end

    def create_login_session
        user = User.find_by(username: params[:session][:username])
        
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id 
          redirect_to user_path(user.id)  
        else 
          flash[:errors] = ["username or password did not match"]
          redirect_to login_path
        end
    end

    def logout
        session[:user_id] = nil

        redirect_to origamis_path
    end



    #-------------ADD-TO-BASKET-------------#

    def add_to_basket
        origami = Origami.find(params[:origami_id])
        
        @logged_in_user.add_to_basket(origami)

        redirect_to user_path(@logged_in_user.id)
    end


    #-------------DELETE-FROM-BASKET-------------#

    def delete_from_basket
        origami = Origami.find(params[:origami_id])
        
        @logged_in_user.delete_from_basket(origami)

        redirect_to user_path(@logged_in_user.id)
    end

    #-------------STRONG-PARAMS-------------#

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :bio)
    end

end
