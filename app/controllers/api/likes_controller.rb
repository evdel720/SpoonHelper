class Api::LikesController < ApplicationController
  before_action :redirect_home_if_not_logged_in
  def create
    @like = Like.create(user_id: current_user.id, recipe_id: params[:id])
    render json: @like.recipe
  end

  def destroy
    @like = Like.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    delete_recipe = @like.recipe
    @like.destroy
    render json: delete_recipe
  end
end
