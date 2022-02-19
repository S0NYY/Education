#...
class GroupsController < ApplicationController
  before_action :init_service

  def index
    @groups = @groups_service.list
  end

  def new
    result = @groups_service.new
    @group = result.group
  end

  def create
    result = @groups_service.create(group_params)
    @group = result.group

    if result.success?
      redirect_to groups_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    result = @groups_service.edit(params[:id])
    @group = result.group
  end

  def update
    result = @groups_service.update(params[:id], group_params)
    @group = result.group

    if result.success?
      redirect_to groups_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @groups_service.delete(params[:id])

    if result.success?
      redirect_to groups_path
    end
  end

  private

  def init_service
    @groups_service = Groups::GroupsService.new
  end

  def group_params
    params.require(:group).permit(:course_id, :name, :active)
  end
end
