class StudentsController < ApplicationController
  def index
  end

  def new
    @student = Student.new
  end

  def create
    @user = current_user
    @student = @user.students.build(params.require(:student).permit(:id, :name, :age_group))
    
    if @student.save
      flash[:notice] = "Student added to your account."
    else
      flash[:error] = "There was a problem adding that student. Please try again."
    end
  end

  def edit
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
end
