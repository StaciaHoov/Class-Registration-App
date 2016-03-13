class WaitlistStudentsController < ApplicationController
  def new
    @user = current_user
    @waitlist = Waitlist.find(params[:waitlist_id])
    @course = @waitlist.course
    @waitlist_student = WaitlistStudent.new(params.permit(:student_id, :waitlist_id))
  end

  def create
    @waitlist_student = WaitlistStudent.new(waitlist_student_params)
    if @waitlist_student.save
      flash[:notice] = "Student was added to waitlist."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was a problem adding student to waitlist. Check if student is already on the list."
      redirect_to courses_path
    end
  end

  def edit
   
  end

  def destroy
  end
  
  private
  
  def waitlist_student_params
    params.require(:waitlist_student).permit(:student_id, :waitlist_id)
  end
end
