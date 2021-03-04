module ApplicationHelper
  def session_links
    content = ''
    if session[:id]
      content << "<span>#{current_user.name}</span>"
      content << "<span class = 'm-left-10'>|</span>"
      content << "<span class = 'm-left-10'>#{link_to 'Logout', '/sessions', method: :delete}</span>"
    else
      content << "<span>#{link_to 'Login', '/sessions'}</span>"
      content << "<span class = 'm-left-10'>|</span>"
      content << "<span class = 'm-left-10'>#{link_to 'Sign Up', new_user_path}</span>"
    end
    content.html_safe
  end
end
