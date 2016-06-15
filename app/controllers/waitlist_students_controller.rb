class WaitlistStudentsController < ApplicationController
  def new
    @user = current_user
    @waitlist = Waitlist.find(params[:waitlist_id])
    @course = @waitlist.course
    @waitlist_student = WaitlistStudent.new(waitlist_student_params)
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

  def destroy
    @waitlist_student = WaitlistStudent.find(params[:id])
    if @waitlist_student.destroy
      flash[:notice] = "Student removed from waitlist"
      redirect_to courses_path
    else
      flash[:error] = "There was a problem removing student from list."
    end
  end
  
  private
  
  def waitlist_student_params
    params.require(:waitlist_student).permit(:student_id, :waitlist_id)
  end
end
