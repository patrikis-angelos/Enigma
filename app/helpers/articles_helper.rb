module ArticlesHelper
  def show_articles(articles)
    count = -1
    content = ''
    articles.each do |article|
      if count <= 0
        content << "<div class = 'article bg-color-red'>"
        content << "#{render article}"
        content << "</div>"
      else
        content << "<div class = 'article bg-color-blue'>"
        content << "#{render article}"
        content << "</div>"
      end
      count = count == 2 ? -1 : count + 1
    end
    content.html_safe
  end
end
