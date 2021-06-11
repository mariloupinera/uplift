class AppsPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(:favour).where(favours: { user: user })
    end
  end

  def create?
    true
  end

  def update?
    record.favour.user == user
  end
end