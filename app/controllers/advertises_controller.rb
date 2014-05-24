class AdvertisesController < ApplicationController
  expose(:advertises) { Advertise.all }
  expose(:advertise, attributes: :advertise_params)

  def index
  end

  def show
  end

  def new
  end

  def create
    if advertise.save
      current_user.advertises << advertise
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    redirect_to :back unless current_user.owner? advertise
  end

  def update
    if advertise.save
      render action: :index
    else
      render :new
    end
  end

  def destroy
    if current_user.owner? advertise
      advertise.destroy
      render action: :index
    else
      redirect_to :back
    end
  end

  def product
  end

  private

  def advertise_params
    params.require(:advertise).permit(:title, :body )
  end

end
