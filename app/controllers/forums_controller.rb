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
  
  def edit
  end
  
  def update
    @forum.update_attributes(params[:forum])
    perms = {}
    Forum::Permissions.each do |permission|
      perms[permission] ||= []
      User::Roles.each do |role|
        perms[permission].push role if params["check_#{permission.downcase}_#{role.downcase}"] == "1"
      end
      @forum.send(:"#{permission.downcase}_mask=", @forum.apply_bitmask(perms[permission]))
    end
    @forum.save
    redirect_to forum_topics_path(@forum)
  end
end