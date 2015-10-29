class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.list_by_age_time
  end


  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
      if @course.save
        redirect_to courses_path 
      else
        render :new
      end
      
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:notice] = "Course was successfully updated."
      redirect_to courses_path
    else
      flash[:error] = "There was a problem updating course."
      render :edit
    end
  end


  def destroy
    if @course.destroy 
      redirect_to courses_path
   else
      flash[:error] = "There was a problem deleting the course."
      render :show
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:user_id, :title, :description, :age_group, :time_block, :max_students, :fee)
    end
end
