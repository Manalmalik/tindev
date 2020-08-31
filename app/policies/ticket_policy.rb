class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def edit?
    user
  end

  def update?
    user
  end

  def show?
    true
  end

  def destroy?
    user
  end

  def filtered?
    true
  end

end
