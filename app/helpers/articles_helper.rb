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

  def show_upvote(article)
    if current_user
      if !article.voted_by?(current_user)
        url = "/articles/#{article.id}/votes"
        link_to 'Upvote', url, method: :post
      else
        url = "/articles/#{article.id}/votes/#{current_user.find_users_vote(article)}"
        link_to 'Downvote', url, method: :delete
      end
    end
  end

  def show_best_article
    content = ''
    if @best_article
      content << "<div class = 'radial-grad absolute z-1'></div>
                  <img class = 'absolute img' src='#{@best_article.image}' alt = ''>
                  <div class = 'absolute bottom p-left-20 p-bottom-10 z-2' >
                  <p class = 'm-bottom-10 extra-bold color-secondary'>#{@best_article.title}</p>
                  <p class = 'color-white'>#{@best_article.text}</p>
                  </div>"
    end
    content.html_safe
  end
end

