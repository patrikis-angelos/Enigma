module SessionsHelper
  def session_links
    content = ''
    if session[:id]
      content << "<span class = 'color-primary small'>#{link_to current_user.name, current_user_path}</span>
                  <span class = 'm-left-10 color-primary small'>|</span>
                  <span class = 'm-left-10 color-primary small'>#{link_to 'Create article', new_article_path}</span>
                  <span class = 'm-left-10 color-primary small'>|</span>
                  <span class = 'm-left-10 color-primary small'>#{link_to 'Logout', '/sessions',
                                                                          method: :delete}</span>"
    else
      content << "<span class = 'color-primary small'>#{link_to 'Login', '/sessions'}</span>
                  <span class = 'm-left-10 color-primary small'>|</span>
                  <span class = 'm-left-10 color-primary small'>#{link_to 'Sign Up', new_user_path}</span>"
    end
    content.html_safe
  end
end
