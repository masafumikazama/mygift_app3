class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @registries = @user.registries.all
  end
end
