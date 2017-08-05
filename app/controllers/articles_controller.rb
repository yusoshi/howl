class ArticlesController < ApplicationController
  def index
    @articles = Article.order(updated_at: :DESC).includes(:user)
  end

  def show
    @article = Article.includes(:user).find(params[:id])
    @good = Good.find_by(user_id: current_user.id, article_id: params[:id])
    @comments = Comment.where(article_id: params[:id])
  end
end
