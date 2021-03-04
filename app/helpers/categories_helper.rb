module CategoriesHelper
  def category_links
    content = ''
    categories = Category.all.order(:priority)
    categories.each do |category|
      content << "<span class = 'm-left-30'>#{link_to category.name, category}</span>"
    end
    content.html_safe
  end

  def latest_article(category)
    category.last_article.title unless category.articles.empty?
  end
end
