class FavoursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new, :create]

   def index
      @favours = Favour.all
     # the `geocoded` scope filters only favours with coordinates (latitude & longitude)

    if params[:query].present?
      @favours = policy_scope(Favour.where("zone ILIKE ?", "%#{params[:query]}%"))
    else
      @favours = policy_scope(Favour.includes(:user))
    end

    @markers = @favours.geocoded.map do |favour|
      {
        lat: favour.latitude,
        lng: favour.longitude
      }
    end
   end

  def show
    @favour = Favour.find(params[:id])
    @markers = [{ lat: @favour.latitude, lng: @favour.longitude }]
    authorize(@favour)
  end

  def new
    @favour = Favour.new
    authorize(@favour)
  end

  def create
  @favour = Favour.new(favour_params)
  authorize(@favour)
  @favour.user = current_user
    if @favour.save
      redirect_to favours_path, notice: 'Your favour was added!'
    else
      render :new
    end



  end



  private

  def favour_params
    params.require(:favour).permit(:title, :duration, :description, :zone, :photo, :favour_type_id)
  end

end
