class FavoursController < ApplicationController

  def create
  @favour = Favour.new(favour_params)
  @favour.user = current_user
    if @favour.save
      redirect_to favours_path, notice: 'Your favour was added!'
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @favours = policy_scope(Favour.where("zone ILIKE ?", "%#{params[:query]}%"))
    else
      @favours = policy_scope(Favour.includes(:user))
    end
  end
end
