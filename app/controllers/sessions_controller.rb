class SessionsController < ApplicationController
  
  def instructor_login_new 
    if !!logged_in?
      @instructor = Instructor.find_by_id(params[:instructor_id]) #worked once and then stopped
      redirect_to instructor_path(@instructor)
    end
  end

  def instructor_login_create 
    instructor = Instructor.find_by(username: params[:username])
    if instructor && instructor.authenticate(params[:password])
      session[:instructor_id] = instructor.id
      redirect_to instructor_path(instructor.id)
    else 
      render :instructor_login_new
    end
  end

  def logout 
     session.delete :instructor_id
     redirect_to root_path
  end

  def omniauth 
 
    instructor = Instructor.find_or_create_by(uid: request.env['omniauth.auth'][:uid], provider: request.env['omniauth.auth'][:provider]) do |u|
    
      u.username = request.env['omniauth.auth'][:info][:first_name]
      #  u.email = request.env['omniauth.auth'][:info][:email]
      u.password = SecureRandom.hex(15)
    end 

    if instructor.valid?
      session[:instructor_id] = instructor.id 
      redirect_to instructor_path(instructor.id)
    else
      redirect_to login_path 
    end 
end

end
