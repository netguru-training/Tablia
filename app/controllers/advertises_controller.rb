class AdvertisesController < ApplicationController
  expose(:advertises) { Advertise.all }
  expose(:advertise, attributes: :advertise_params)

  def index
  end

  def show
  end

  def new
  end

  private

  def advertise_params
    params.require(:advertise).permit(:title, :body )
  end

end
