class ArticlesController < ApplicationController
  before_action :ensure_user

  def new
    @categories = Category.all
    @article = Article.new
  end

  def create
    @categories = Category.all
    @article = current_user.articles.build(article_params)
    if params[:category_ids]
      ids = params[:category_ids].values
      selected_cat = Category.find(ids)
      @article.categories << selected_cat
    end

    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image)
  end
end
