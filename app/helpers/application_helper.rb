module ApplicationHelper
  def current_year
    Time.current.year
  end

  def view_flash(type)
    content_tag(:p, flash[type], class: "#{type.to_s}-flash")
  end
end
