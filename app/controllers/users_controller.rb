class UsersController < ApplicationController
  load_and_authorize_resource
  def edit
    @regions = Region.all
  end
  
  def show
  end
  
  def set_world
    @user = User.find(params[:user_id])
    @user.world_id = params[:world_id]
    @user.save
  end
end