class CoursesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      @courses = current_user.courses.sort_by(&:semester_conversion)
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    grades = {
      "A+" => 4.33,
      "A" => 4.00,
      "A-" => 3.67,
      "B+" => 3.33,
      "B" => 3.00,
      "B-" => 2.67,
      "C+" => 2.33,
      "C" => 2.00,
      "C-" => 1.67,
      "D+" => 1.33,
      "D" => 1.00,
      "D-" => 0.67,
      "F" => 0.00,
    }
    level = {
      "traditional" => 0,
      "honors" => 0.5,
      "AP" => 1.0,
    }
    calculated_point_value = (grades[params[:grade]] + level[params[:level]]) * params[:credits].to_f
    @course = Course.new(
      name: params[:name],
      grade: params[:grade],
      credits: params[:credits],
      level: params[:level],
      semester_taken: params[:semester_taken],
      point_value: calculated_point_value,
      user_id: current_user.id,
    )
    @course.save
    render :show
  end

  def show
    @course = Course.find_by(id: params[:id])
    render :show
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:name] || course.name
    @course.grade = params[:grade] || course.grade
    @course.credits = params[:credits] || course.credits
    @course.level = params[:level] || course.level
    @course.semester_taken = params[:semester_taken] || course.semester_taken
    @course.point_value = params[:point_value] || course.point_value
    if @course.save
      render :show
    else
      render json: { errors: @course.errors.full_messages }, status: 422
    end
  end

  def destroy
    course = Course.find_by(id: params[:id])
    course.destroy
    render json: { message: "course removed" }
  end
end
