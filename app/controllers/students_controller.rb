class StudentsController < ApplicationController
 
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by_id(params[:id])
  end

  def new
    if !logged_in?
      @student = Student.new
    else
        redirect_to root_path
    end
    
  end

  def create
    student = Student.new(student_params)
    if student.save 
      session[:student_id] = student.id 
      redirect_to student_path(student) 
    else
        render :new
    end
  end

  def edit
    @student = Student.find_by_id(params[:id])
  end

  def update
    @student = Student.find_by_id(params[:id])
    if @student.update(student_params)
        redirect_to student_path(@student)
    else  
      render :edit
    end
  end

  def delete
    session.delete :student_id
    redirect_to root_path
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :native_language, :other_languages, :date_of_birth, :bio)
  end
 


end
