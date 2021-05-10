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
      redirect_to root_path
    end
  end

  def edit
  
    @instructor = Instructor.find_by_id(params[:id])
    if @instructor == current_instructor
    else 
        redirect_to instructor_path(current_instructor)
    end
  end

  # def update
  #   @instructor = Instructor.find_by_id(params[:id])
  #   if @instructor == current_instructor.id 
  #     @instructor.update(instructor_params)
  #   else
  #     render :edit
  #   end
  # end

  def update
    @instructor = Instructor.find_by_id(params[:id])
    if @instructor == current_instructor
    @instructor.update(instructor_params)
    end
    # @instructor.attributes=instructor_params
    # @instructor.save(:validate => false)
      redirect_to instructor_path(@instructor)
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

