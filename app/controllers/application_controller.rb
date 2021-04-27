class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper

    def root
        if !logged_in?
            redirect_to login_path 
        end
    end 

    private 

    
end
