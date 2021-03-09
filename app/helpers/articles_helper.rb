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
    return unless current_user

    if !article.voted_by?(current_user)
      url = "/articles/#{article.id}/votes"
      link_to 'Upvote', url, method: :post
    else
      url = "/articles/#{article.id}/votes/#{current_user.find_users_vote(article)}"
      link_to 'Downvote', url, method: :delete
    end
  end

  def show_best_article
    content = ''
    return content unless @best_article

    url = "/users/#{@best_article.author.id}"
    content << "<p class = 'p-left-10 m-top-5 extra-small absolute z-2 color-secondary bold'>
                Written by #{link_to @best_article.author.name, url}</p>
                <div class = 'radial-grad absolute z-1'></div>
                <img class = 'absolute img' src='#{@best_article.image}' alt = ''>
                <div class = 'absolute bottom p-left-20 p-bottom-10 z-2' >
                <p class = 'm-bottom-10 extra-bold color-secondary'>#{@best_article.title}</p>
                <p class = 'color-white'>#{@best_article.text.truncate(200, omission: '...')}</p>
                </div>"
    content.html_safe
  end

  def show_truncated_text(article)
    article.text.truncate(900, omission: '...')
  end
end
