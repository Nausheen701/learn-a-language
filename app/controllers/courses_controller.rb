class CoursesController < ApplicationController
  before_action :set_course, except: [:index, :new, :create]
   
  def index #responsible for showing all courses route: '/courses' path: courses_path
    if params[:instructor_id]
      @instructor = Instructor.find_by(params[:instructor_id])
      @courses = @instructor.courses
    else
      @courses = Course.all
    end
  end

  def new #responsibile for rending a new form route: 'courses/new' path: new_course_path
    if params[:instructor_id]
      @instructor = Instructor.find_by(params[:instructor_id])
      @course = @instructor.courses.build
    else
      @course = Course.new
      @course.build_instructor #creates an empty associated object
  end

  def create #responsible for processing submitted new form route: '/courses'
    if params[:instructor_id]
      @instructor = Instructor.find_by(params[:instructor_id])
      @course = @instructor.courses.build(course_params)
      # @course = Course.new(course_params(:language, :level, :age_group, :class_size, :location, :day, :time))
    else 
      @course = Course.new(course_params)
    end

    if @course.save
      redirect_to course_path(@course)
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
    # @course = Course.find_by_id(params[:id])
    if @course.update(course_params)
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    # @course = Course.find_by_id(params[:id])
    @course.destroy
    redirect_to courses_path
  end

  # private

  def course_params #strong params: permits fields being submitted
    params.require(:course).permit(:language, :level, :age_group, :class_size, :location, :day, :start_time, :end_time)
  end

end
end
