module ApplicationHelper

    def logged_in?
        !!session[:member_id]
      end
end
