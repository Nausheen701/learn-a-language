class CoursesController < ApplicationController
   
  def index #responsible for showing all courses route: '/courses' path: courses_path
    @courses = Course.all

  end

  def new #responsibile for rending a new form route: 'courses/new' path: new_course_path
    @course = Course.new
    @course.build_instructor #creates an empty associated object
  end

  def create #responsible for processing submitted new form route: '/courses'
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
