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
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end
end