class ArticlesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @articles = Article.order("created_at DESC")
  end
  
  def new
    @article = Article.new
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      render :show
    else
      flash[:alert] = "Unable to save article"
      render :new
    end
  end
end