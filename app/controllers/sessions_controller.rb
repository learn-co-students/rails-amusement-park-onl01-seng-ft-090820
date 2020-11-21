class SessionsController < ApplicationController
    
    def new
    end

    def create
        @user = User.find_by(id: params[:session][:user_id])
        if @user
            @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end