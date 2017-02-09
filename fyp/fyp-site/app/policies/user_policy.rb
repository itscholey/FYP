class UserPolicy < ApplicationPolicy

  def create?
    (user.admin? or user.roles?(teacher)) && user.logged_in?
  end
end
