class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def index
    @tiny_courses = Course.where(age_group: 'Tiny')
    @small_courses = Course.where(age_group: 'Small')
    @medium_courses = Course.where(age_group: 'Medium')
    @big_courses = Course.where(age_group: 'Big')
    @adult_courses = Course.where(age_group: 'Adult')
    
  end
  
  def planning
    @tiny_courses = Course.where(age_group: 'Tiny')
    @small_courses = Course.where(age_group: 'Small')
    @medium_courses = Course.where(age_group: 'Medium')
    @big_courses = Course.where(age_group: 'Big')
    @adult_courses = Course.where(age_group: 'Adult')
  end

  def show
    @course = Course.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render :json => @course}
    end
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create 
    @course = Course.new(course_params)
      if @course.save
        redirect_to courses_planning_path
      else
        render :new
      end
      
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes!(course_params)
      respond_to do |format|
        format.html { redirect_to( courses_path)}
        format.json { render :json => @course }
      end
    else
      respond_to do |format|
        format.html { render :action => :edit } #edit.html.erb
        format.json { render :nothing => true }
      end
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
