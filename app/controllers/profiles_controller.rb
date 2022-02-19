#...
class ProfilesController < ApplicationController
  before_action :init_service

  def index
    if current_user.admin?
      @profiles = @profiles_service.list
    else
      @profiles = @profiles_service.profile
    end
  end

  def new
    result = @profiles_service.new
    @profile = result.profile

    authorize @profile
  end
  
  def create
    result = @profiles_service.create(profile_params)
    @profile = result.profile

    if result.success?
      redirect_to profiles_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    result = @profiles_service.edit(params[:id])
    @profile = result.profile
    authorize @profile
  end

  def update
    result = @profiles_service.update(params[:id], profile_params)
    @profile = result.profile

    if result.success?
      redirect_to profiles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    result = @profiles_service.delete(params[:id])

    if result.success?
      redirect_to profiles_path
    end
  end

  private

  def init_service
    @profiles_service = Profiles::ProfilesService.new(current_user)
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :pin, :mobile_phone, :birth_date, :active)
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
