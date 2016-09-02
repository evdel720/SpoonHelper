class Api::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    if params[:category_id]
      @recipes = Recipe.where(category_id: params[:category_id])
      @category = Category.find_by(id: params[:category_id]).title
    else
      @recipes = Recipe.all
      @category = 'All'
    end
    @sorted_by = ''
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
    render {}
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

#
# params = {recipe: {
#   title: "handleSubmit",
#   description: "handleSubmithandleSubmit",
#   ingredients: "handleSubmithandleSubmit",
#   user_id: 1,
#   category_id: 2,
#   steps_attributes: [{
#     id: 163, body: "new first step", order: 0 },
#   { id: 164, _destroy: '1'},
#   { id: 165, body: "new second step", order: 2 },
#   { id: 166, body: "new third step", order: 3 }]
# }}
