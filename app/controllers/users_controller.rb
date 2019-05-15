class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id

        redirect_to user_path(@user)

    end

    def show
        
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end