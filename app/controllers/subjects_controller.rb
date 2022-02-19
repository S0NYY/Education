#...
class SubjectsController < ApplicationController
  before_action :init_service

  def index
    @subjects = @subjects_service.list
  end

  def new
    result = @subjects_service.new
    @subject = result.subject
  end

  def create
    result = @subjects_service.create(subject_params)
    @subject = result.subject

    if result.success?
      redirect_to subjects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    result = @subjects_service.edit(params[:id])
    @subject = result.subject
  end

  def update
    result = @subjects_service.update(params[:id], subject_params)
    @subject = result.subject

    if result.success?
      redirect_to subjects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @subjects_service.delete(params[:id])

    if result.success?
      redirect_to subjects_path
    end
  end

  private

  def init_service
    @subjects_service = Subjects::SubjectsService.new
  end

  def subject_params
    params.require(:subject).permit(:name, :active, :user_id)
  end
end
