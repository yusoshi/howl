class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user)
  end

  def show
    @article = Article.includes(:user).find(params[:id])
  end
end
