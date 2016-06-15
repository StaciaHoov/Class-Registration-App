class StudentsController < ApplicationController

  def new
    @student = Student.new
    authorize @student
  end

  def create
    @user = current_user
    @student = @user.students.build(student_params)
    authorize @student
    
    if @student.save
      flash[:notice] = "Student added to your account."
    else
      flash[:error] = "There was a problem adding that student. Please try again."
    end
  end

  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    
    if @student.update_attributes(student_params)
      flash[:notice] = "Student enrolled in class."
    else
      flash[:error] = "There was a problem enrolling student. Please try again."
    end
    redirect_to user_path(current_user)
  end
      

  def destroy
    @user = current_user
    @student = @user.students.find(params[:id])
    if @student.destroy
      flash[:notice] = "Student removed"
    else
      flash[:error] = "There was a problem removing student. Please try again."
    end
  end
  
    private
  
  def student_params
    params.require(:student).permit(:id, :name, :age, 
    schedules_attributes: [:student_id, :first_course_id, :second_course_id, :third_course_id, :_destroy])
  end
end
