module ApplicationHelper
  def session_links
    content = ''
    if session[:id]
      content << "<span class = 'color-primary small'>#{current_user.name}</span>"
      content << "<span class = 'm-left-10 color-primary small'>|</span>"
      content << "<span class = 'm-left-10 color-primary small'>#{link_to 'Create article', new_article_path}</span>"
      content << "<span class = 'm-left-10 color-primary small'>|</span>"
      content << "<span class = 'm-left-10 color-primary small'>#{link_to 'Logout', '/sessions',
                                                                          method: :delete}</span>"
    else
      content << "<span class = 'color-primary small'>#{link_to 'Login', '/sessions'}</span>"
      content << "<span class = 'm-left-10 color-primary small'>|</span>"
      content << "<span class = 'm-left-10 color-primary small'>#{link_to 'Sign Up', new_user_path}</span>"
    end
    content.html_safe
  end

  def display_error(model)
    content = ''
    return content unless model.errors

    model.errors.full_messages.each do |error|
      content << "<p>#{error}</p>"
    end
    content.html_safe
  end
end
