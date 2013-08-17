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

  def inplace_edit_activator_id(object, field)
    "#{object.class.to_s.downcase}-#{object.grandham_id}-#{field}"
  end

  def edit_icon(object, field)
    content_tag :span, class: 'inplace-edit', id: inplace_edit_activator_id(object, field) do
      content_tag :i, class: 'icon-edit' do
      end
    end
  end

  def inplace_edit(object, field, params = {})
    params.merge!(activator: "##{inplace_edit_activator_id(object, field)}" )

    content_tag :div, class: 'inplace-edit-container' do
      if params[:grandham_link]
        path = "language_#{object.class.to_s.downcase}_path"
        link = link_to best_in_place(object, field, params), send(path, object.language, object)
        "#{link} #{edit_icon(object, field)}".html_safe
      else
        "#{best_in_place(object, field, params)} #{edit_icon(object, field)}".html_safe
      end
    end
  end
end