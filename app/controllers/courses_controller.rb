class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


  def index
    @courses_by_age = Course.all.group_by(&:age_group)
    @courses_by_age_time = @courses_by_age.map do |age_group, array_age|  
      [age_group, array_age.group_by(&:time_block)]
    end
    
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
        redirect_to '/courses' 
      else
        render :new
      end
      
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

  def destroy
    if @course.destroy 
      redirect_to '/courses'
   else
      flash[:error] = "There was a problem deleting the course."
      render :show
    end
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def course_params
      params.require(:course).permit(:user_id, :title, :description, :age_group, :time_block, :max_students, :fee)
    end
end
