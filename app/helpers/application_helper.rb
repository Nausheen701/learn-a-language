module ApplicationHelper
    def current_instructor #memoization: caches the results of the method and speeds up accessor methods
        @current_instructor ||= Instructor.find_by(id: session[:instructor_id])
    end

    def logged_in?
        current_instructor
    end

end
