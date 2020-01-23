class SessionsController < ApplicationController
    skip_before_action :authorize, only: [:new, :create]
  
  
    def new 
      # render new
    end 
  
    def create 
      user = User.find_by(name: params[:session][:name])
      
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id 
        redirect_to user_path(user.id)  
      else 
        flash[:errors] = ["username or password did not match"]
        redirect_to login_path
      end 
    end 
  
  
    def destroy
      session[:user_id] = nil
      # session.delete(:user_id)
      redirect_to users_path
    end
    
  end 