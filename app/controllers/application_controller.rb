class ApplicationController < ActionController::Base

    private
        def current_user
            @current_user ||= User.find_by_id(session[:user_id])
            #or/equals will only call DB once if using it 1+ times in a method
        end

end
