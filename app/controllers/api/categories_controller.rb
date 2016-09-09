class Api::CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:image, recipes: [:image]).all
    render :index
  end
end
