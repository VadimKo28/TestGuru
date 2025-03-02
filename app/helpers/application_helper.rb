module ApplicationHelper
  def current_year
    Time.current.year
  end

  def alert_flash
    content_tag(:p, flash[:alert], class: 'alert-flash')
  end
end
