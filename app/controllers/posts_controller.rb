class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @topic = @posts.first.topic
    @forum = @topic.forum
    @posts = @posts.page(params[:page]).per(10)
  end
  
  def new
    @topic = Topic.find(params[:topic_id])
    @forum = @topic.forum
    @post.user = current_user
    @post.topic = @topic
    @post.forum = @topic.forum
  end
  
  def create
    if @post.save
      redirect_to forum_topic_posts_path(@post.topic.forum, @post.topic), notice: "Successfully replied"
    else
      render 'new', alert: 'Unable to save'
    end
  end
end