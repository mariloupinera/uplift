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

  def show?
    record.favour.user == user || record.user == user
  end
  
  def mark_as_done?
    record.favour.user == user
  end
end
