class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @registries = @user.registries.all
  end
  
  def search
    @user = User.find_by(params[:id])
    @registries = @user.registries.all
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
end
