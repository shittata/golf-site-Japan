require "application_system_test_case"

class GolfCoursesTest < ApplicationSystemTestCase
  setup do
    @golf_course = golf_courses(:one)
  end

  test "visiting the index" do
    visit golf_courses_url
    assert_selector "h1", text: "Golf courses"
  end

  test "should create golf course" do
    visit golf_courses_url
    click_on "New golf course"

    fill_in "Area", with: @golf_course.area
    fill_in "Description", with: @golf_course.description
    fill_in "Image url", with: @golf_course.image_url
    fill_in "Name", with: @golf_course.name
    fill_in "Official url", with: @golf_course.official_url
    click_on "Create Golf course"

    assert_text "Golf course was successfully created"
    click_on "Back"
  end

  test "should update Golf course" do
    visit golf_course_url(@golf_course)
    click_on "Edit this golf course", match: :first

    fill_in "Area", with: @golf_course.area
    fill_in "Description", with: @golf_course.description
    fill_in "Image url", with: @golf_course.image_url
    fill_in "Name", with: @golf_course.name
    fill_in "Official url", with: @golf_course.official_url
    click_on "Update Golf course"

    assert_text "Golf course was successfully updated"
    click_on "Back"
  end

  test "should destroy Golf course" do
    visit golf_course_url(@golf_course)
    click_on "Destroy this golf course", match: :first

    assert_text "Golf course was successfully destroyed"
  end
end
