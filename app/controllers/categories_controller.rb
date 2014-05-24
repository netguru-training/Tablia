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
  end

  def delete
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
