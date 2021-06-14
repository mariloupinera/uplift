class CreditsController < ApplicationController
  def index
    @credit = policy_scope(Credit.includes(:application, :favour))
  end
end
