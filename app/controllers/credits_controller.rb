class CreditsController < ApplicationController
  def index
    @credits = policy_scope(Credit).includes(:user)
    @applications = current_user.completed_applications
    @transactions = @credits.to_a.concat(@applications).sort_by(&:created_at)
  end
end
