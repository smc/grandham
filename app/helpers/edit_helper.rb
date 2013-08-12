module EditHelper
  def record_edit(object, object_params)

    field = object_params.keys.first

    old_value = object.send(field)
    new_value = object_params[field]

    object.edits.create old_value: old_value, new_value: new_value, user_id: 1, field: field

    flash[:notice] = 'Your edit(s) has been submitted for approval.'
  end
end