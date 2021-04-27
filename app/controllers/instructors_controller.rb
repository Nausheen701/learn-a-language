class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find_by_id(params[:id])
  end

  def new #render a signup form
    if !logged_in?
      @instructor = Instructor.new
    else
        redirect_to root_path
    end
  end

  def create #process sign up form
    instructor = Instructor.new(instructor_params)
    if instructor.save
      # log user in
      session[:instructor_id] = instructor.id
      redirect_to instructor_path(instructor) #takes them to welcome page
    else 
      # show some errors
      # make them try again
      render :new
    end
  end

  def edit
    @instructor = Instructor.find_by_id(params[:id])
  end

  def update
    @instructor = Instructor.find_by_id(params[:id])
    binding.pry
	  @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    # else  
    #   render :edit
    # end
  end


  def delete
    session.delete :instructor_id
    redirect_to login_path
  end

  private 

  def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :ethnicity, :native_language, :other_languages, :instructional_languages, :date_of_birth, :education, :teaching_experience, :bio)
  end
end

