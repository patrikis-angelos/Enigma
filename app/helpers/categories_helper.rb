module CategoriesHelper
  def category_links
    content = ''
    categories = Category.all.order(:created_at)
    categories.each do |category|
      content << "<span class = 'm-left-30 color-primary small'>#{link_to category.name, category}</span>"
    end
    content.html_safe
  end

  def category_checkboxes(form)
    content = ''
    @categories.each do |category|
      category_ids = "category_ids[#{category.name}]"
      content << "<div><span>#{check_box_tag category_ids, category.id}</sapn>
                  <span>#{form.label category.name, category.name}<span></div>"
    end
    content.html_safe
  end

  def show_category_names(article)
    content = ''
    if @category
      content << "<p class = 'color-secondary-light bold'>#{@category.name}</p>"
      content << "<div class = 'underline bg-color-secondary-light'>"
      content << '</div>'
    elsif @user
      article.categories.each do |category|
        cat_path = "/categories/#{category.id}"
        content << "<div class = 'm-right-5'>"
        content << "<p class = 'p-right-5 color-secondary-light bold'>#{link_to category.name, cat_path}</p>"
        content << "<div class = 'underline bg-color-secondary-light'>"
        content << '</div>'
        content << '</div>'
      end
    end
    content.html_safe
  end
end
