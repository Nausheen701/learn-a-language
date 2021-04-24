class SessionsController < ApplicationController
  def new #render the login form
    if logged_in?
        redirect_to instructor_path(@instructor)
    end
  end

  def create #process the login form
    instructor = Instructor.find_by(username: params[:username])
    if instructor && instructor.authenticate(params[:password])
      session[:instructor_id] = instructor.id
      redirect_to instructor_path
    else 
      render :new
    end
  end

  def destroy #logout 
    # delete sessions hash
    session.delete :instructor_id
    redirect_to login_path
  end

end
