class InstructorsController < ApplicationController

  def index
    @instructors = Instructor.all
  end

  def show
    @instructor = Instructor.find_by_id(params[:id])
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      redirect_to instructor_path(@instructor)
    else 
      render :new
    end
  end

  def edit
    @instructor = Instructor.find_by_id(params[:id])
  end

  def update
    @instructor = Instructor.find_by_id(params[:id])
	  if @instructor.update(instructor_params)
      redirect_to instructor_path(@instructor)
    else  
      render :edit
    end
  end

  # def update
  #   @instructor = Instructor.find_by_id(params[:id])
	#   if @instructor.update(instructor_params)
  #     redirect_to instructor_path(@instructor)
  #   else  
  #     render :edit
  #   end
  # end

  def delete
  end

  private 

  def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :ethnicity, :native_language, :other_languages, :instructional_languages, :date_of_birth, :education, :teaching_experience, :bio)
  end
end

