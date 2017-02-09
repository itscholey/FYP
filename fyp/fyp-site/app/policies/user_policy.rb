class UserPolicy < ApplicationPolicy
  def new?
  end

  def create?
    user.admin? or user.teacher?
  end
end
