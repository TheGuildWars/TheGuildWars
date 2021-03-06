class TopicsController < ApplicationController
  load_and_authorize_resource
  def index
    @forum = Forum.find(params[:forum_id])
    @topics = @forum.topics.where(sticky: false).page(params[:page]).per(20)
    @stickys = @forum.topics.where(sticky: true)
  end
  
  def show
    @posts = @topic.posts
  end
  
  def new
    @forum = Forum.find(params[:forum_id])
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic.forum_id = @forum.id
    @post = @topic.posts.new
    @post.body = @topic.post_body
    @post.user_id = current_user.id
    @post.forum_id = @topic.forum_id
    @topic.save
    @post.save
    redirect_to forum_topic_posts_path(@forum, @topic)
  end
  
  def close
    @topic.closed = true
    @topic.save
    redirect_to forum_topic_posts_path(@topic.forum, @topic), alert: 'Topic Closed!'
  end
  
  def open
    @topic.closed = false
    @topic.save
    redirect_to forum_topic_posts_path(@topic.forum, @topic), alert: 'Topic Opened!'
  end
  
  def sticky
    @topic.sticky = true
    @topic.save
    redirect_to forum_topic_posts_path(@topic.forum, @topic), alert: 'Topic Stuck!'
  end
  
  def un_sticky
    @topic.sticky = false
    @topic.save
    redirect_to forum_topic_posts_path(@topic.forum, @topic), alert: 'Topic Un Stuck!'
  end
end