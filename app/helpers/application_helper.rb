module ApplicationHelper
  def languages_menu_heading
    if current_language
      "Language (#{current_language.short_code})"
    else
      "Language (all)"
    end
  end

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

  def is_resource_active?(grandham_resource)
    'active' if params[:controller] == grandham_resource
  end

  def is_active(activated_page, page)
    page == activated_page.to_s ? 'active' : ''
  end
end