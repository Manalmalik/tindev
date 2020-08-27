class TicketPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    record.user == user
  end

  def create?
    true
  end

  def new?
    true
  end

  def show?
    true
  end

  def destroy?
    user
  end
end
