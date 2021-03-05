module ArticlesHelper
  def show_articles(articles)
    count = -1
    content = ''
    articles.each do |article|
      if count <= 0
        @inverse_flex = ''
        @end = ''
      else
        @inverse_flex = 'inverse-flex'
        @end = 'end'
      end
      content << (render article)
      count = count == 2 ? -1 : count + 1
    end
    content.html_safe
  end
end
