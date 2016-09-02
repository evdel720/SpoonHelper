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
    @instructions = @recipe.images
    @instructions += @recipe.videos
    @instructions += @recipe.steps

    render :show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    instruction = params[:instructions] || []
    @recipe.user_id = current_user.id
    @instructions = []
    instruction.each do |k, v|
      case v['type']
      when 'step'
        @instructions << Step.new(body: v['body'], order: k) if v['body'].length > 0
      when 'image'
        @instructions << Image.new(url: v['url'], order: k)
      when 'video'
        @instructions << Video.new(url: v['url'], order: k)
      end
    end


    if @recipe.save
      @instructions.each do |ins|
        if ins.class == Image
          ins.imageable = @recipe
        else
          ins.recipe = @recipe
        end
        ins.save
      end
      render :show
    else
      @errors = @recipe.errors
      render '/api/errors', status: 400
    end
  end

  def update
    instructions = params[:instructions] || []
    if @recipe.update(recipe_params)
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
