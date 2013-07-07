module ApplicationHelper

  def current_language_path(resource)
    if current_language
      send "language_#{resource}_path", current_language
    else
      send "#{resource}_path"
    end
  end
end
