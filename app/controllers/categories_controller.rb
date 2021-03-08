class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:priority).limit(4)
    @best_article = Article.best
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles.order(created_at: :desc)
    session[:url] = category_path
  end
end
