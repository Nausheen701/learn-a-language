class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update]

  def new 
    if logged_in?
       redirect_to student_path(current_student)  
    else
      @student = Student.new   
    end
  end

  def index
    @students = Student.alpha
  end

  def show
  end

  def create 
    @student = Student.new(student_params)
    if @student.save
      # session[:student_id] = student.id
      redirect_to student_path(@student)
    else 
      render :new
    end
  end

  def edit
    # if @student != current_student 
    #   redirect_to student_path(current_student)
    # end
  end

  def update
    # if @student == current_student
    # @student.update(student_params)
    # else 
    @student.attributes=student_params
    @student.save(:validate => false)
      redirect_to student_path(@student)
    # end
  end

   
  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :native_language, :other_languages, :date_of_birth, :bio)
  end
 
  def set_student
    @student = Student.find_by_id(params[:id])
  end

end

