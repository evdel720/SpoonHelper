class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(user_params[:username], user_params[:password])
    if @user
      login(@user)
      render '/api/users/show'
    else
      @errors = { username: ["doesn't exist or password is invalid."] }
      render '/api/errors', status: 400
    end
  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: {errors: "No user is logged in."}, status: 404
    end
  end
end
