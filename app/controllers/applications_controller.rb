class ApplicationsController < ApplicationController


  def index
    @applications = policy_scope(Application.includes(:user, :favour))
  end


  def create
    @application = Application.new
    @favour = Favour.find(params[:favour_id])
    @application.favour = @favour
    @application.user = current_user
    authorize @application
    if @application.save
      redirect_to favour_path(@favour)
      flash[:alert] = "Application successfully submitted"
    else
      render 'favours/show'
    end
  end

  private

  # def application_params
  #   params.require(:application).permit(:content)
  # end
end
