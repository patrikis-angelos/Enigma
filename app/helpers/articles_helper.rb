module ArticlesHelper
  def show_articles(articles)
    count = -1
    content = ''
    articles.each do |article|
      if count <= 0
        @color = 'red'
      else
        @color = 'blue'
      end
      content << (render article)
      count = count == 2 ? -1 : count + 1
    end
    content.html_safe
  end
end
