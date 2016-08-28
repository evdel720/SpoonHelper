class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render :show
    else
      @errors = @user.errors.full_messages
      render '/api/errors'
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user == @user && @user.update(user_params)
      render :show
    else
      @errors = @user.errors.full_messages
      render '/api/errors'
    end
  end
end
