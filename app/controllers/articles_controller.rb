class ArticlesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def new
  end
  
  def show
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      render :show, notice: "Successfully posted article"
    else
      flash[:alert] = "Unable to save article"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully posted article"
      render :show
    else
      flash[:alert] = "Unable to update article"
    end
  end
end