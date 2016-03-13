class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  
  def index
    courses_by_age
  end
  
  def planning
    courses_by_age
  end

  def show
    @course = Course.find(params[:id])
    @schedules_with_course = Schedule.where(first_course_id:  @course.id) ||
    Schedule.where(second_course_id:  @course.id) || Schedule.where(third_course_id:  @course.id)
  
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
        @waitlist = Waitlist.new(course_id: @course.id)
        @waitlist.save
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
        format.html { render :action => :edit } 
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
      params.require(:course).permit(:user_id, :title, :description, :age_group, :time_block, 
      :max_students, :fee, :seats_taken, :room, :guest_teacher, :note)
    end
    
    def courses_by_age
      @tiny_courses = Course.where(age_group: ['Tiny', 'All']) 
      @small_courses = Course.where(age_group: ['Small','All']) 
      @medium_courses = Course.where(age_group: ['Medium','All']) 
      @big_courses = Course.where(age_group: ['Big', 'All']) 
      @adult_courses = Course.where(age_group: ['Adult', 'All']) 
    end
end
