class FavoursController < ApplicationController



  def index
    @favours = policy_scope(Favour)
  end

  def new
    @favour = Favour.new
    authorize(@favour)
  end

  def create
  @favour = Favour.new(favour_params)
  @favour.user = current_user
    if @favour.save
      redirect_to favours_path, notice: 'Your favour was added!'
    else
      render :new
    end
  end

  private

  def favour_params
    params.require(:favour).permit(:title, :duration, :description, :zone, :photo)
  end

end
