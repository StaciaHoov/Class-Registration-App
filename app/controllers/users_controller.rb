class UsersController < ApplicationController
  def show
    @user = current_user
    @students = @user.students
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Update successful"
    else
      flash[:error] = "There was a problem updating your account."
    end
    redirect_to @user
  end
  
  private
  
  def user_params
    params.require(:user).permit(:email, :password, :name, students_attributes: [:id, :name, :age_group, :_destroy])
  end
end
