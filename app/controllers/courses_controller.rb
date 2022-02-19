# ...
class CoursesController < ApplicationController
  before_action :init_service

  def index
    @courses = @courses_service.list
  end

  def new
    result = @courses_service.new
    @course = result.course
  end

  def create
    result = @courses_service.create(course_params)
    @course = result.course

    if result.success?
      redirect_to courses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    result = @courses_service.edit(params[:id])
    @course = result.course
  end

  def update
    result = @courses_service.update(params[:id], course_params)
    @course = result.course

    if result.success?
      redirect_to courses_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @courses_service.delete(params[:id])

    if result.success?
      redirect_to courses_path
    end
  end

  private

  def init_service
    @courses_service = Courses::CoursesService.new
  end

  def course_params
    params.require(:course).permit(:name, :active)
  end
end
