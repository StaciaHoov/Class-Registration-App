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

  def destroy
    @wait = Wait.find(params[:id])
    if @wait.destroy
      redirect_to :back
    end
  end
  
  private
    def wait_params
      params.require(:wait).permit(:student_id, :course_id)
    end
end
