module ApplicationHelper
  def session_links
    content = ''
    if session[:id]
      current_user_path = "/users/#{current_user.id}"
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

  def display_error(model)
    content = ''
    return content unless model.errors

    model.errors.full_messages.each do |error|
      content << "<p>#{error}</p>"
    end
    content.html_safe
  end

  def display_alert
    content = ''
    if alert.present?
      content << "<div class = 'bg-color-alert color-primary'>
                  <p class = 'p-y-5 center-text'>#{alert}</p>
                  </div>"
    end
    content.html_safe
  end

  def display_confirm
    content = ''
    if notice.present?
      content << "<div class = 'bg-color-confirm color-primary'>
                  <p class = 'p-y-5 center-text'>#{notice}</p>
                  </div>"
    end
    content.html_safe
  end
end
