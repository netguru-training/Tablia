class CategoriesController < ApplicationController
  expose(:categories) {Category.all}
  expose(:category, attributes: :category_params)

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new

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

end
