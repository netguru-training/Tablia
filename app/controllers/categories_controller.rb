class CategoriesController < ApplicationController
  expose(:categories) {Category.all}
  expose(:category, attributes: :category_params)

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :authenticate_admin, only: [:new, :create, :edit, :update, :destroy]

  def new
    @icons = ['fa-car fa-2', 'fa-child fa-2', 'fa-paw fa-2',
              'fa-paper-plane fa-2', 'fa-flask fa-2', 'fa-space-shuttle fa-2',
              'fa-camera fa-2', 'fa-cogs fa-2', 'fa-desktop fa-2',
              'fa-female fa-2', 'fa-glass fa-2', 'fa-heart fa-2']
  end

  def show
  end

  def index
  end

  def create
    if category.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def update
    if category.update
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon_class)
  end

  def authenticate_admin
    redirect_to root_path unless current_user.admin?
  end

end
