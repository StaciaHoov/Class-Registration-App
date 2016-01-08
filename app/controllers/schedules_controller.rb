class SchedulesController < ApplicationController
  
  
  def new
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
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:student_id, :first_course_id, :second_course_id, :third_course_id, :_destroy)
  end
end
