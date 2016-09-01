class Api::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    if params[:category_id]
      @recipes = Recipe.where(category_id: params[:category_id])
    else
      @recipes = Recipe.all
    end
    render :index
  end

  def show
    render :show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render :show
    else
      @errors = @recipe.errors
      render '/api/errors', status: 400
    end
  end

  def update
    if @recipe.put(recipe_params)
      render :show
    else
      render '/api/errors', status: 400
    end
  end

  def destroy
    @recipe.destroy
    render {}
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
    render json: 'Invalid recipe id', status: 404 unless @recipe
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :category_id)
  end
end
