module ApplicationHelper

  def current_language_path(resource)
    if current_language
      send "language_#{resource}_path", current_language
    else
      send "#{resource}_path"
    end
  end

  def external_link(object)
    path = "language_#{object.class.to_s.downcase}_path"

    content_tag :span, class: 'external_link' do
      link_to send(path, object.language, object) do
        content_tag :i, class: 'icon-external-link' do
        end
      end
    end
  end
end
