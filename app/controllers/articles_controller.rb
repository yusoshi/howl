class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user)
  end
end
