class CoursesController < ApplicationController

  def index 
    if params[:instructor_id] && @instructor = Instructor.find_by_id(params[:instructor_id])
      @courses = @instructor.courses
    else
      @courses = Course.all
    end
  end

  def new 
    if params[:instructor_id] && @instructor = Instructor.find_by_id(params[:instructor_id]) 
        @course = @instructor.courses.build
    else
       redirect_to instructors_new_path(@instructor)
    end
  end

  def create 
    if params[:instructor_id] && @instructor = Instructor.find_by_id(params[:instructor_id])
      @course = @instructor.courses.build(course_params)
    else 
       @course = Course.new(course_params)
    end

    if @course.save
      redirect_to instructor_courses_path(@instructor, @course)
    else
      render :new
    end
  end

  def show 
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
  
  end

  def edit
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
    redirect_to instructor_path(current_instructor) unless @course.instructor_id == current_instructor.id
  end


    def update
      @instructor = Instructor.find_by_id(params[:instructor_id])
      @course = Course.find_by_id(params[:id])
      if @course.update(course_params)
        redirect_to instructor_courses_path(@instructor)
      else  
        render :edit
      end
    end

  def destroy
    @instructor = Instructor.find_by_id(params[:instructor_id])
    @course = Course.find_by_id(params[:id])
    @course.destroy
    redirect_to instructor_path(current_instructor)
  end


  private

  def course_params 
    params.require(:course).permit(:language, :level, :age_group, :class_size, :location, :day, :start_time, :end_time, :instructor_id, :student_id)
  end

  def set_students
    @students = Student.all
  end

end
