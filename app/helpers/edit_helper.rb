module EditHelper
  def record_edit(object, object_params)

    field = object_params.keys.first

    # Safeguarding the following .send call.
    return unless object.class.new.attributes.keys.include?(field)

    old_value = object.send(field)
    new_value = object_params[field]

    object.edits.create old_value: old_value, new_value: new_value, user_id: 1, field: field, language_id: object.language.id

    flash[:notice] = 'Your edit(s) have been submitted for approval.'
  end
end