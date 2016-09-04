class Api::CommentsController < ApplicationController

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
    @comment = Comment.find_by(params[:comment_id])
    if @comment
      @comment.destroy
      render :show
    else
      render status: 404
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
