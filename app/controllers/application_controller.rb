class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include ApplicationHelper

    def root
        if !logged_in?
            redirect_to login_path 
        end
    end 

    private 

    helpers do 
        def current_instructor # return logged in user 
         @current_instructor ||= Instructor.find_by_id(session[:instructor_id]) #memoization
        end 
         # check if a user logged in
        def logged_in?
           !!session[:instructor_id]
        end 
    end  
end
