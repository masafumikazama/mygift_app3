class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @registries = @user.registries.all
  end
  
  def search
    if params[:name].present?
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users = User.none
    end
  end
  
  def searched_user
    @user = User.find(params[:id])
    @registries = @user.registries.all
  end
end
