class CoursesController < ApplicationController
  # before_action :set_course, except: [:index, :new, :create]
   
  def index #responsible for showing all courses route: '/courses' path: courses_path
    if params[:instructor_id]
      @instructor = Instructor.find_by_id(params[:instructor_id])
      @courses = @instructor.courses
    else
      @courses = Course.all
    end
  end

  def new #responsibile for rendering a new form route: 'courses/new' path: new_course_path
    if params[:instructor_id]
      @instructor = Instructor.find_by_id(params[:instructor_id])
      @course = @instructor.courses.build
    else
      @course = Course.new
      @course.build_instructor #creates an empty associated object
    end
  end

  def create #responsible for processing submitted new form route: '/courses'
    if params[:instructor_id]
      @instructor = Instructor.find_by_id(params[:instructor_id])
      @course = @instructor.courses.build(course_params)
      # @course = Course.new(course_params(:language, :level, :age_group, :class_size, :location, :day, :time))
    else 
      @course = Course.new(course_params)
    end
    if @course.save
      # redirect_to courses_path
      redirect_to instructor_courses_path(@instructor, @course)
    else
      render :new
    end
  end

  def show #responsible for showing single course 
    if params[:instructor_id] # this is checking if this a nested route
      @instructor = Instructor.find_by_id(params[:instructor_id])
      @course = @instructor.courses.find_by_id(params[:id])
    else #not in the nested route
      @course = Course.find_by_id(params[:id])
    end
  end

  def edit
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
    redirect_to instructor_course_path unless @course.instructor_id == current_instructor.id
  end

  def update
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
    if @course.instructor_id == current_instructor.id 
    end
    if @course.update(course_params)
      redirect_to instructor_course_path(@instructor, @course)
    else
      render :edit
    end
  end

  def destroy
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
    Course.find_by_id(params[:id])
    @course.destroy
    # redirect_to courses_path(current_instructor)
    redirect_to instructor_path(current_instructor)
  end


  # private

  def course_params #strong params: permits fields being submitted
    params.require(:course).permit(:language, :level, :age_group, :class_size, :location, :day, :start_time, :end_time)
  end


end
