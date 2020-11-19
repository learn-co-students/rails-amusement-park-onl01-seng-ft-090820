class UsersController < ApplicationController
    # before_action :require_login 
    # skip_before_action :require_login, only: [:new, :create]
    def new 
        @user = User.new
    end 

    def create 
        # binding.pry
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id
            redirect_to @user
        else  
            redirect_to new_user_path
        end 
    end 

    def show 
        if logged_in? 
        @user = User.find_by(id: params[:id])
        render :show 
        else  
            redirect_to root_path
        end
    end


    # private 
    # def require_login
    #     if !session[:user_id]
    #         redirect_to '/sessions/new'
    #     end
    # end


    def user_params
        params.require(:user).permit(:name, :height, :nausea, :tickets, :happiness, :password, :admin)
    end 
end
