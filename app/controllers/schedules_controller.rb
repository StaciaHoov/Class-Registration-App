class SchedulesController < ApplicationController
  
  def new    
    available_courses
    @schedule = Schedule.new
    @user = current_user
    authorize @schedule
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def create 
    @schedule = Schedule.new(schedule_params)
    authorize @schedule
    if @schedule.save
      redirect_to user_path(current_user) 
    else
     flash[:error] = "There was a problem creating that schedule. Please try again." 
      redirect_to user_path(current_user) 
    end
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    authorize @schedule
    if @schedule.destroy
      flash[:notice] = "Schedule removed"
    else
      flash[:error] = "There was a problem removing schedule. Please try again and check the status of your courses."
    end
    redirect_to user_path(current_user)
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
    authorize @schedule
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    authorize @schedule
    if @schedule.update_attributes(schedule_params)
      flash[:notice] = "Schedule updated."
    else
      flash[:danger] = "There was a problem editing the schedule. Please try again."
    end
    redirect_to user_path(current_user)
  end
  
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:student_id, :first_course_id, :second_course_id, :third_course_id, :_destroy)
  end

  def available_courses
      @courses_first = Course.where(time_block: '1', course_full: false)
      @courses_second = Course.where(time_block: '2', course_full: false)
      @courses_third = Course.where(time_block: '3', course_full: false)
  end
end
