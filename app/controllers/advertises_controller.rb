class AdvertisesController < ApplicationController
  expose_decorated(:advertises) { AdvertiseSearch.new(search).results }
  expose_decorated(:advertise, attributes: :advertise_params)
  expose(:search) { search_results }
  expose(:category_id) {advertise.category.present? ? advertise.category.id : nil}

  before_action :owner_of_the_advertise, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :send_email_to_user]


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
    #redirect_to :back unless current_user.owner? advertise
  end

  def update
    if advertise.save
      redirect_to advertise_path(advertise)
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

  def send_email_to_user
    advertise = Advertise.find params[:id]
    user = advertise.user
    MessageMailer.send_message_to_user_about_ad(user, advertise, current_user, message_params[:body]).deliver
    redirect_to advertise
  end

  protected

  def search_results
    params[:query][:by_phrase] = params[:query][:title] if params[:query]
    params[:query] || {}
  end

  private

    def message_params
      params.require(:email_hash).permit(:body)
    end

    def advertise_params
      params.require(:advertise).permit(:title, :body, :photo, :category_id)
    end

    def owner_of_the_advertise
      redirect_to :root unless current_user == advertise.user
    end

end
