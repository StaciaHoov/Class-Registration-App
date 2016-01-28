class SchedulesController < ApplicationController
  def new
    @courses_first_block = Course.where(time_block: 1)
    @courses_second_block = Course.where(time_block: 2)
    @courses_third_block = Course.where(time_block: 3)
    @schedule = Schedule.new
    @user = current_user
  end

  def show
    @schedule = Schedule.find(params[:id])
  end
  
  def create 
    @schedule = Schedule.new(schedule_params)
      if @schedule.save
        redirect_to user_path(current_user) 
      else
        render :new
      end
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
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
end
