class WaitsController < ApplicationController
  def new
    @wait = Wait.new(params[:course_id])

  end

  def create
    @wait = Wait.new(wait_params)
    if @wait.save
      redirect_to user_path(current_user) 
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end
  
  private
    def wait_params
      params.require(:wait).permit(:student_id, :course_id)
    end
end
