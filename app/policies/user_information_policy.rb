class UserInformationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    user
  end

  def show
    true
  end

  def edit?
    true
  end

  def toggle_status?
    true
  end
end
