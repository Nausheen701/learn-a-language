class StudentsSessionsController < ApplicationController
 
def new #render the login form
  if logged_in?
      redirect_to student_path(current_student)
  end
end

def create #process the login form
  student = Student.find_by(username: params[:username])
  if student && student.authenticate(params[:password])
    session[:student_id] = student.id
    redirect_to student_path(student)
  else 
    render :new
  end
end

def destroy #logout 
  # delete sessions hash
  session.delete :student_id
  redirect_to login_path
end

end