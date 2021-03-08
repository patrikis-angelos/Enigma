class CategoriesController < ApplicationController
  def index
    # full_categories = ArticleCategory.group(:category_id).count.map {|k, v| k if v > 0}
    # where(id: full_categories)
    @categories = Category.all.order(:priority).limit(4)
    @best_article = Article.best
    # cats = Category.all.order(:priority).limit(4).map(&:id)
    # latest = ArticleCategory.group(:category_id).maximum(:created_at).values
    # latest_ids = ArticleCategory.all.where(category_id: cats, created_at: latest).map(&:article_id)
    # @latest_articles = Article.all.where(id: latest_ids)
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
    session[:url] = category_path
  end
end
