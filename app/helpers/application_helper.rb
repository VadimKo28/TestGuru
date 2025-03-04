module ApplicationHelper
  def current_year
    Time.current.year
  end

  def view_flash(key)
    content_tag(:p, flash[key], class: "#{key}-flash")
  end
end
