module ApplicationHelper
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
