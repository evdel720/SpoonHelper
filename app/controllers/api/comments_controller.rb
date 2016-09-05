class Api::CommentsController < ApplicationController
  before_action :redirect_home_if_not_logged_in

  def create
    @comment = Comment.new(comment_params)
    @comment.recipe_id = params[:id]
    @comment.user = current_user
    if @comment.save
      render :show
    else
      @errors = @comment.errors
      render '/api/errors', status: 400
    end
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    if @comment
      @comment.destroy
      render json: { id: params[:id] }
    else
      render status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
