class CategoriesController < ApplicationController
  expose(:categories) {Category.all}
  expose(:category, attributes: :category_params)

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

  end

  def delete
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
