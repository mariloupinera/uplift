class CreditsController < ApplicationController
  def index
    @credits = policy_scope(Credit).includes(:user)
    @applications = current_user.completed_applications
    @transactions = @credits.to_a.concat(@applications).sort_by(&:created_at)
  end

  def create
    @credit = Credit.new(params[:amount_redeemed])
    # @credit.user = current_user
    authorize @credit
    if @credit.save
      redirect_to root_path
    else
      render 'credits/show'
    end
  end

  private

  # def credit_params
  #   params.require(:credit).permit(:amount_redeemed)
  # end
end
