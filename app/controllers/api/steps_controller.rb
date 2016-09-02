class Api::StepsController < ApplicationController
  def destroy
    @step = Step.find_by(id: params[:id])
    if @step
      @step.destroy
    end
    render json: {}
  end
end
