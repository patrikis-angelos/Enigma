class CategoriesController < ApplicationController
  def index
    @categories = Category.full.order(:priority).limit(4).with_articles
    @best_article = Article.best
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc).with_author_votes
    session[:url] = category_path
  end
end
