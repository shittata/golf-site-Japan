require "test_helper"

class GolfCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @golf_course = golf_courses(:one)
  end

  test "should get index" do
    get golf_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_golf_course_url
    assert_response :success
  end

  test "should create golf_course" do
    assert_difference("GolfCourse.count") do
      post golf_courses_url, params: { golf_course: { area: @golf_course.area, description: @golf_course.description, image_url: @golf_course.image_url, name: @golf_course.name, official_url: @golf_course.official_url } }
    end

    assert_redirected_to golf_course_url(GolfCourse.last)
  end

  test "should show golf_course" do
    get golf_course_url(@golf_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_golf_course_url(@golf_course)
    assert_response :success
  end

  test "should update golf_course" do
    patch golf_course_url(@golf_course), params: { golf_course: { area: @golf_course.area, description: @golf_course.description, image_url: @golf_course.image_url, name: @golf_course.name, official_url: @golf_course.official_url } }
    assert_redirected_to golf_course_url(@golf_course)
  end

  test "should destroy golf_course" do
    assert_difference("GolfCourse.count", -1) do
      delete golf_course_url(@golf_course)
    end

    assert_redirected_to golf_courses_url
  end
end
