class CreditPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.credits
    end
  end
end
