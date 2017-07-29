class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user)
  end

  def show
    @article = Article.find(params[:id])
  end
end
