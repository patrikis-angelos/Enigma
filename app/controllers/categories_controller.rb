class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:priority)
    @best_article = Article.best
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end
end
