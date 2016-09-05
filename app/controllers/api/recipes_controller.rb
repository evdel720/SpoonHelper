class Api::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]
  before_action :redirect_home_if_not_logged_in, only: [:create, :update, :destroy]

  def index
    if params[:category_id] != '0'
      @recipes = Recipe.where(category_id: params[:category_id])
      @category = Category.find_by(id: params[:category_id]).title
    else
      @recipes = Recipe.all
      @category = 'All'
    end
    @sorted_by = ''
    @default_image = '1http://res.cloudinary.com/wkdal720/image/upload/v1472659523/imageedit_1_3889917060_vq3dui.png'
    render :index
  end

  def show
    render :show
  end

  def create
    @recipe = Recipe.new(steps_added_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      render :show
    else
      @errors = @recipe.errors
      render '/api/errors', status: 400
    end
  end

  def update
    if @recipe.update(steps_added_params)
      render :show
    else
      render '/api/errors', status: 400
    end
  end

  def destroy
    @recipe.destroy
    render json: {}
  end

  private

  def set_recipe
    @recipe = Recipe.find_by(id: params[:id])
    render json: 'Invalid recipe id', status: 404 unless @recipe
  end

  def steps_added_params
    temp = recipe_params
    temp['steps_attributes'] = temp['steps'].values
    temp.delete('steps')
    temp
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :ingredients, :category_id, :prep_time, :cook_time, steps: [:id, :body, :order, :_destroy])
  end
end
