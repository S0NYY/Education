# ...
class ExamsController < ApplicationController
  before_action :init_service

  def index
    @exams = @exams_service.list
  end

  def new
    result = @exams_service.new
    @exam = result.exam
  end

  def create
    result = @exams_service.create(exam_params)
    @exam = result.exam

    if result.success?
      redirect_to exams_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    result = @exams_service.edit(params[:id])
    @exam = result.exam
  end

  def update
    result = @exams_service.update(params[:id], exam_params)
    @exam = result.exam

    if result.success?
      redirect_to exams_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @exams_service.delete(params[:id])

    if result.success?
      redirect_to exams_path
    end
  end

  private

  def init_service
    @exams_service = Exams::ExamsService.new
  end

  def exam_params
    params.require(:exam).permit(:group_id, :subject_id, :name, :active).merge(user_id: current_user.id)
  end
end
