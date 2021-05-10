class StudentsController < ApplicationController
 
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
    @student = Student.find_by_id(params[:id])
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
      redirect_to root_path
    end
  end

  def edit
  
    @student = Student.find_by_id(params[:id])
    if @student == current_student
    else 
        redirect_to student_path(current_student)
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
    @student = Student.find_by_id(params[:id])
    if @student == current_student
    @student.update(student_params)
    end
    # @instructor.attributes=instructor_params
    # @instructor.save(:validate => false)
      redirect_to student_path(@student)
  end

  def delete
    session.delete :student_id
    redirect_to "root_path"
  end

   
  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :username, :password, :phone_number, :nationality, :native_language, :other_languages, :date_of_birth, :bio)
  end
 

end

#   def index
#     @students = Student.all
#   end

#   def show
#     @student = Student.find_by_id(params[:id])
#   end

#   def new
#     if !logged_in?
#       @student = Student.new
#     else
#         redirect_to root_path
#     end
    
#   end

#   def create
#     student = Student.new(student_params)
#     if student.save 
#       session[:student_id] = student.id 
#       redirect_to student_path(student) 
#     else
#         render :new
#     end
#   end

#   def edit
#     @student = Student.find_by_id(params[:id])
#   end

#   def update
#     @student = Student.find_by_id(params[:id])
#     if @student.attributes=student_params
#       @student.save(:validate => false)
#       # @student.update(student_params)
#         redirect_to student_path(@student)
#     else  
#       render :edit
#     end
#   end

#   def delete
#     session.delete :student_id
#     redirect_to root_path
#   end

  


#  end
