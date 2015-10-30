class EnrollmentsController < ApplicationController
  

  def index
    
  end


  def show
  end

  def new
    @enrollment = Enrollment.new
    @courses = Course.all.group_by(&:age_group).map do |age_group, array_age|  
      [age_group, array_age.group_by(&:time_block)]
    end
  
  end

  def edit
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    
    if @enrollment.save
      flash[:notice] = "Student enrolled."
    else
      flash[:error] = "There was a problem enrolling student."
    end
    redirect_to courses_path
  end

  def update
  
  end


  def destroy
 
  end

  private
  
  def enrollment_params
    params.require(:enrollment).permit(:student_id, :course_id)
  end
   
end
