class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


  def index
    @courses = Course.all
  end


  def show
  end


  def new
    @course = Course.new
  end


  def edit
  end


  def create
    @course = Course.new(course_params)
      if @course.save
        flash[:notice] = 'Course was successfully created.' 
      else
        flash[:error] = "There was a problem saving that course. Please try again."
      end
      redirect_to @courses
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    if @course.destroy
      redirect_to @courses
   else
      flash[:error] = "There was a problem deleting the course."
      redirect_to @courses
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:user_id, :title, :description, :age_group, :time_block, :max_students, :fee)
    end
end
