class ApplicationsController < ApplicationController


  def index
    @applications = policy_scope(Application.includes(:user, :favour))
  end

  def index_done_applications
    @appications = policy_scope(Application.includes(:user, :favour)).where(status: 0)
  end

  def create
    @application = Application.new
    @favour = Favour.find(params[:favour_id])
    @application.favour = @favour
    @application.user = current_user
    authorize @application
    @application.pending!
    if @application.save
      redirect_to favour_path(@favour)
      flash[:alert] = "Application successfully submitted"
    else
      render 'favours/show'
    end
  end

  def update
    @application = Application.find(params[:id])
    if params[:status] == 0
      @application.accepted!
    elsif params[:status] == 1
      @application.declined!
    end
    authorize @application
    @application.save
  end

  private

  # def application_params
  #   params.require(:application).permit(:content)
  # end
end
