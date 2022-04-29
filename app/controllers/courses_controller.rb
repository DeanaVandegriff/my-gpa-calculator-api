class CoursesController < ApplicationController
  def index
    courses = Course.all
    render json: courses.as_json
  end

  def create
    course = Course.new(
      name: params[:name],
      grade: params[:grade],
      credits: params[:credits],
      level: params[:level],
      semester_taken: params[:semester_taken],
      user_id: current_user.id,
    )
    course.save
    render json: course.as_json
  end

  def show
    course = Course.find_by(id: params[:id])
    render json: course.as_json
  end
  
  def update
    course = Course.find_by(id: params[:id])
    course.name = params[:name] || course.name
    course.grade = params[:grade] || course.grade
    course.credits = params[:credits] || course.credits
    course.level = params[:level] || course.level
    course.semester_taken = params[:semester_taken] || course.semester_taken
    course.save
    render json: course.as_json
  end

  def destroy
    course = Course.find_by(id: params[:id])
    course.destroy
    render json: { message: "course removed" }
  end
end
