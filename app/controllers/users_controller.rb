class UsersController < ApplicationController
    #before_action :require_login
    #skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end

    end

    def show
        #byebug
        @user = User.find_by_id(params[:id])
        if !@user
            redirect_to root_path
        end
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def require_login
        if !session.include? :user_id
            redirect_to 'users/new'
        end
    end
end