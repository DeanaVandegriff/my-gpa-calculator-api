class CoursesController < ApplicationController
  before_action :authenticate_user

  def index
    if current_user
      courses = current_user.courses
      render :index
    else
      render json: [], status: :unauthorized
    end
  end

  def create
    @course = Course.new(
      name: params[:name],
      grade: params[:grade],
      credits: params[:credits],
      level: params[:level],
      semester_taken: params[:semester_taken],
      user_id: current_user.id,
      point_value: point_value,
    )
    if @course.save
      render :show
    else
      render json: { errors: @course.errors.full_messages }, status: 422
    end
  end

  def show
    @course = Course.find_by(id: params[:id])
    render template: "courses/show"
  end

  def update
    @course = Course.find_by(id: params[:id])
    @course.name = params[:name] || course.name
    @course.grade = params[:grade] || course.grade
    @course.credits = params[:credits] || course.credits
    @course.level = params[:level] || course.level
    @course.semester_taken = params[:semester_taken] || course.semester_taken
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
