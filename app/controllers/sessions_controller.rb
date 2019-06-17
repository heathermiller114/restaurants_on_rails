class SessionsController < ApplicationController

    def index

    end

    def new

    end

    def create
        byebug
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
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

        @user = User.find_or_create_by(email: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
            u.username = auth[:info][:name]
        end
        
        #byebug
        @user.username = ("#{@user.username}" + "#{@user.id}").gsub(/\s+/, "")
        @user.save

        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end