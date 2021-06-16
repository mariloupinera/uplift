class CreditsController < ApplicationController
  def index
    @credits = policy_scope(Credit).includes(:user)
    @applications = current_user.completed_applications
    @transactions = @credits.to_a.concat(@applications).sort_by(&:created_at)
  end

  def jobs
    authorize Credit
  end

  def redeem
    authorize Credit
  end

  def create
    @credit = Credit.new(credit_params)
    @credit.user = current_user
    authorize @credit
    if @credit.save
      redirect_to jobs_credits_path
    else
      render 'credits/show'
    end
  end

  private

  def credit_params
    params.permit(:amount_redeemed)
  end
end
