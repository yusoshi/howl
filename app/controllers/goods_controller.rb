class GoodsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    @good = Good.new(user_id: current_user.id, article_id: article.id)
    if @good.save
      @goods_count_hash = { count: article.goods.count }
      respond_to do |format|
        format.html
        format.json { render json: @goods_count_hash}
      end
    else
      flash.now[:alert] = "いいねに失敗しました。"
    end
    @goods = Good.where(article_id: article.id)
    @articles = Article.all
  end

  def destroy
    article = Article.find(params[:article_id])
    if @good = Good.find_by(user_id: current_user.id, article_id: params[:article_id])
      @good.destroy
      @goods_count_hash = { count: article.goods.count }
      respond_to do |format|
        format.html
        format.json { render json: @goods_count_hash }
      end
    else
      flash.now[:alert] = "いいねの取り消しに失敗しました。"
    end
    @goods = Good.where(article_id: params[:article_id])
    @articles = Article.all
  end
end
