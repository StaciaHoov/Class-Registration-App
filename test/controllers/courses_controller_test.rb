require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { age_group: @course.age_group, date: @course.date, description: @course.description, fee: @course.fee, id: @course.id, integer,: @course.integer,, integer,: @course.integer,, integer,: @course.integer,, max_students: @course.max_students, session: @course.session, string,: @course.string,, string,: @course.string,, string,: @course.string,, time,: @course.time,, time_block: @course.time_block, title: @course.title, user: @course.user }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    patch :update, id: @course, course: { age_group: @course.age_group, date: @course.date, description: @course.description, fee: @course.fee, id: @course.id, integer,: @course.integer,, integer,: @course.integer,, integer,: @course.integer,, max_students: @course.max_students, session: @course.session, string,: @course.string,, string,: @course.string,, string,: @course.string,, time,: @course.time,, time_block: @course.time_block, title: @course.title, user: @course.user }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
