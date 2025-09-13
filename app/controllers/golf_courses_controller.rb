class GolfCoursesController < ApplicationController
  before_action :set_golf_course, only: %i[ show edit update destroy ]

  # GET /golf_courses or /golf_courses.json
  def index
    @meimon_courses     = GolfCourse.where("tags LIKE ?", "%名門%")
    @kakuyasu_courses   = GolfCourse.where("tags LIKE ?", "%格安%")
    @nando_hard_courses = GolfCourse.where("tags LIKE ?", "%難コース%")
    @nando_easy_courses = GolfCourse.where("tags LIKE ?", "%易コース%")  
  end

  # GET /golf_courses/1 or /golf_courses/1.json
  def show
  end

  # GET /golf_courses/new
  def new
    @golf_course = GolfCourse.new
  end

  # GET /golf_courses/1/edit
  def edit
  end

  # POST /golf_courses or /golf_courses.json
  def create
    @golf_course = GolfCourse.new(golf_course_params)

    respond_to do |format|
      if @golf_course.save
        format.html { redirect_to @golf_course, notice: "Golf course was successfully created." }
        format.json { render :show, status: :created, location: @golf_course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @golf_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /golf_courses/1 or /golf_courses/1.json
  def update
    respond_to do |format|
      if @golf_course.update(golf_course_params)
        format.html { redirect_to @golf_course, notice: "Golf course was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @golf_course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @golf_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /golf_courses/1 or /golf_courses/1.json
  def destroy
    @golf_course.destroy!

    respond_to do |format|
      format.html { redirect_to golf_courses_path, notice: "Golf course was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_golf_course
      @golf_course = GolfCourse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def golf_course_params
      params.require(:golf_course).permit(:name, :area, :description, :image_url, :official_url)
    end
end
