class EnrollmentsController < ApplicationController
  

  def index
    
  end

  def show
  end

  def new
    @enrollment = Enrollment.new
  end

  def edit
    @enrollment = Enrollment.find(params[:id])
  end

  def create
    @student = Student.find(params[:student_id])
    @enrollment = @student.enrollments.build(enrollment_params)
    
    if @enrollment.save
      flash[:notice] = "Student enrolled."
    else
      flash[:error] = "There was a problem enrolling student."
    end
    redirect_to courses_path
  end

  def update
    @student = Student.find(params[:student_id])
    @course = Course.find(params[:course_id])
  
  end


  def destroy
    @enrollment = Enrollment.find(params[:id])
    if @enrollment.destroy
      flash[:notice] = "Class removed."
    else
      flash[:error] = "There was an error removing that class from the schedule."
    end
    redirect_to :back
  end

  private
  
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
   
end
