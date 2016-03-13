class WaitlistsController < ApplicationController
  def new
    @waitlist = Waitlist.all
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def waitlist_params
    params.require(:waitlist).permit(:course_id)
  end
end
