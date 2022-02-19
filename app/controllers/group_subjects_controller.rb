#...
class GroupSubjectsController < ApplicationController
  before_action :init_service

  def index
    @group_subjects = @group_subjects_service.list
  end

  def new
    result = @group_subjects_service.new
    @group_subject = result.group_subject
  end

  def create
    result = @group_subjects_service.create(group_subjects_params)
    @group_subject = result.group_subject

    if result.success?
      redirect_to group_subjects_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    result = @group_subjects_service.edit(params[:id])
    @group_subject = result.group_subject
  end

  def update
    result = @group_subjects_service.update(params[:id], group_subjects_params)
    @group_subject = result.group_subject

    if result.success?
      redirect_to group_subjects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @group_subjects_service.delete(params[:id])

    if result.success?
      redirect_to group_subjects_path
    end
  end

  private

  def init_service
    @group_subjects_service = GroupSubjects::GroupSubjectsService.new
  end

  def group_subjects_params
    params.require(:group_subject).permit(:group_id, :subject_id)
  end
end
