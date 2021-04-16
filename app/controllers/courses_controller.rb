class CoursesController < ApplicationController
  before_action :set_donation, except: [:index, :new, :create]
   
  def index #responsible for showing all courses route: '/courses' path: courses_path
    if params[:student_id]
      @student = Student.find_by(params[:student_id])
      @courses = @student.courses
    else
      @courses = Course.all
    end
  end

  def new #responsibile for rending a new form route: 'courses/new' path: new_course_path
    if params[:student_id]
      @student = Student.find_by(params[:student_id])
      @course = @student.courses.build
    else
      @course = Course.new
      @course.build_student#creates an empty associated object
  end

  def create #responsible for processing submitted new form route: '/courses'
    if params[:student_id]
      @
    @course = Course.new(course_params(:language, :level, :age_group, :class_size, :location, :day, :time))
    if @course.save
      redirect_to courses_path
    else
      render :new
    end
  end

  def show #responsible for showing single course route: '/course/:id' path: course_path(course_id)
    @course = Course.find_by_id(params[:id])
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def update
    @course = Course.find_by_id(params[:id])
    @course.update(course_params(:language))
  end

  def destroy
    @course = Course.find_by_id(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  

  private

  def course_params #strong params: permits fields being submitted
    params.require(:course).permit(:language, :level, :age_group, :class_size, :location, :day, :time)
  end

end
