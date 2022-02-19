# ...
class ProfilePolicy < ApplicationPolicy
  def index?
    if user.admin?
      true
    end
  end

  def new?
    if user.admin?
      true
    end
  end

  def edit?
    user.id == record.user_id || user.admin?
  end
end
