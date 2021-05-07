class InstructorsController < ApplicationController
  # def new
  #   @instructor = Instructor.new
  # end

  def new #render a signup form
    
    if !logged_in?
    #   @instructor = Instructor.new
        redirect_to signup_path
    end
      @instructor = Instructor.new
  end

  def index
    # @instructors = Instructor.all
    # @instructors = Instructor.ins_courses
    @instructors = Instructor.alpha
  end

  def show
    @instructor = Instructor.find_by_id(params[:id])
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
    if @instructor == current_instructor
    @instructor = Instructor.find_by_id(params[:id])
    # else
    #   flash[:error] = "You do not have permission to edit another instructor's profile."
    #     redirect_to instructor_path(@instructor)
    end
  end

  def update
    @instructor = Instructor.find_by_id(params[:id])
    # @instructor.update(instructor_params)
    @instructor.attributes=instructor_params

    @instructor.save(:validate => false)
      redirect_to instructor_path(@instructor)
    # else  
    #   render :edit 
    # end
  end


  def delete
    session.delete :instructor_id
    redirect_to "root_path"
  end

  private 

  def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :username, :email, :password, :phone_number, :nationality, :ethnicity, :native_language, :other_languages, :instructional_languages, :date_of_birth, :education, :teaching_experience, :bio)
  end
end

