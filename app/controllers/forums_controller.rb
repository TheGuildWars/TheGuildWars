class ForumsController < ApplicationController
  load_and_authorize_resource
  def index
    @forums = Forum.top_level
  end
  
  def new
  end
  
  def create
    if @forum.save
      redirect_to forums_path, notice: "Forum created!"
    else
      flash[:notice] = "Unable to Save forum"
      render 'new'
    end
  end
end