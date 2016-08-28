class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(user_params[:email], user_params[:password])
    if @user
      login(@user)
      render '/api/users/show'
    else
      @errors = ['Invalid email or password']
      render '/api/errors'
    end
  end

  def destroy
    logout
  end
end
