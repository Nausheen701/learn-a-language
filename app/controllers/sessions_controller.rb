class SessionsController < ApplicationController
  
  def instructor_login_new #render the login form
    if !!logged_in?
        redirect_to instructor_path(current_instructor)
    end
      # render :instructor_login_new
  end

  def instructor_login_create #process the login form
    instructor = Instructor.find_by(username: params[:username])
    if instructor && instructor.authenticate(params[:password])
      session[:instructor_id] = instructor.id
      redirect_to instructor_path(instructor.id)
    else 
      render :instructor_login_new
    end
  end

  def logout #logout 
    # delete sessions hash
     session.delete :instructor_id
     redirect_to root_path
  end

# def student_login_new #render the login form
#   if logged_in?
#       redirect_to student_path(current_student)
#   end
# end

# def student_login_create #process the login form
#   student = Student.find_by(username: params[:username])
#   if student && student.authenticate(params[:password])
#     session[:student_id] = student.id
#     redirect_to student_path(student)
#   else 
#     render :new
#   end
# end

# def student_login_destroy #logout 
#   # delete sessions hash
#   session.delete :student_id
#   redirect_to login_path
# end

def omniauth 
 
  instructor = Instructor.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
    
    u.username = request.env['omniauth.auth'][:info][:first_name]
    #  u.email = request.env['omniauth.auth'][:info][:email]
    u.password = SecureRandom.hex(15)
  end 

  if instructor.valid?
    session[:instructor_id] = instructor.id # log them 
    # redirect_to instructor_path(instructor.id)
     redirect_to instructor_path(current_instructor)
  else
    redirect_to login_path 
  end 
end

end
