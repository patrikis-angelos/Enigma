class CategoriesController < ApplicationController
  def index
    @categories = Category.all.order(:priority)
    @best_article = Article.best
  end
end
