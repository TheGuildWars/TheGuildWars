class StaticController < ApplicationController
  skip_authorization_check [:home, :about]
  def home
    @article = Article.last
  end
  
  def about
  end
  
  def error401
  end
end