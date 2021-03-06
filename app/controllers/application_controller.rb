class ApplicationController < ActionController::Base
    before_action :require_login

    private
        def current_user
            @current_user ||= User.find_by_id(session[:user_id])
            #or/equals will only call DB once if using it 1+ times in a method
        end

        def require_login
            if !session.include? :user_id
                redirect_to '/users/new'
            end
        end

end
