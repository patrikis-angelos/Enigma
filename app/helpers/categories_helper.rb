module CategoriesHelper
  def category_links
    content = ''
    categories = Category.all.order(:created_at)
    categories.each do |category|
      content << "<span class = 'm-left-30 color-primary small'>#{link_to category.name, category}</span>"
    end
    content.html_safe
  end

  def category_tags(form)
    content = ''
    @categories.each do |category|
      h = "category_ids[#{category.name}]"
      content << "<div><span>#{check_box_tag h, category.id}</sapn>
                  <span>#{form.label category.name, category.name}<span></div>"
    end
    content.html_safe
  end

  def latest_article(category)
    category.last_article unless category.articles.empty?
  end
end
