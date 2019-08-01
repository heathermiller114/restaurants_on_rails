class SessionsController < ApplicationController
    skip_before_action :require_login

    def index

    end

    def new

    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to restaurants_path
        else
            flash[:error] = "Sorry, we were unable to log you in"
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    def omniauth
        @user = User.create_user_from_google(auth)

        @user.username = ("#{@user.username}" + "#{@user.id}").gsub(/\s+/, "")
        @user.save

        session[:user_id] = @user.id
        redirect_to restaurants_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end