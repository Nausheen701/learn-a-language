class StudentsController < ApplicationController
  
 
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @user.save #either true or false
        redirect_to user_path(@user) #/users/:id
    else
        render :new
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
        redirect_to student_path(@student)
    else  
      render :edit
    end
  end


  def delete
  end

 

end
