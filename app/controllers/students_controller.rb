class StudentsController < ApplicationController
  before_action :set_student, except: [:new, :index, :create, :delete]
    # def new
  #   @instructor = Instructor.new
  # end

  def new #render a signup form
    
    if !logged_in?
    #   @instructor = Instructor.new
        redirect_to signup_path
    end
      @student = Student.new
  end

  def index
    # @instructors = Instructor.all
    # @instructors = Instructor.ins_courses
    @students = Student.alpha
  end

  def show
    # @student = Student.find_by_id(params[:id])
  end

  def create #process sign up form
    student = Student.new(student_params)
    if student.save
      # log user in
      session[:student_id] = student.id
      redirect_to student_path(student) #takes them to welcome page
    else 
      # show some errors
      # make them try again
      # redirect_to root_path
      render :new
    end
  end

  def edit
    #  @student = Student.find_by_id(params[:id])
    if @student == current_student
    else 
        redirect_to student_path(current_student)
    end
  end

  # def edit
  #   # @student = Student.find_by_id(params[:id])
  #   if @student == current_student
  #   else 
  #       redirect_to student_path(current_student)
  #   end
  # end

  # def update
  #   @instructor = Instructor.find_by_id(params[:id])
  #   if @instructor == current_instructor.id 
  #     @instructor.update(instructor_params)
  #   else
  #     render :edit
  #   end
  # end

  def update
    # @student = Student.find_by_id(params[:id])
    if @student == current_student
    @student.update(student_params)
    else 
    # @instructor.attributes=instructor_params
    # @instructor.save(:validate => false)
      redirect_to student_path(@student)
    end
  end

  def delete
    session.delete :student_id
    redirect_to "root_path"
  end

   
  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :native_language, :other_languages, :date_of_birth, :bio)
  end
 
  def set_student
    @student = Student.find_by_id(params[:id])
  end

end

