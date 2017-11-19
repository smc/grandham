# frozen_string_literal: true

module EditHelper
  def record_edit(object, object_params, book_id = nil)
    object_params.keys.each do |field|
      # Safeguarding the following .send call.

      next unless object.class.new.attributes.keys.include?(field)

      old_value = object.send(field)
      new_value = object_params[field]

      next if old_value.to_s == new_value.to_s

      if current_user.is_an_admin?
        object.update_attributes object_params
        state = 'approved'
      else
        flash[:notice] = 'Your edit(s) have been submitted for approval.'
        state = 'open'
      end

      object.edits.create old_value: old_value, new_value: new_value, user_id: current_user.id, field: field, language_id: object.language.id, book_id: book_id, state: state
    end
  end

  def author_path(object, param = nil)
    book_path = current_book ? "?book_id=#{current_book.grandham_id}" : ''
    super(object, param) + book_path
  end

  def publisher_path(object, param = nil)
    book_path = current_book ? "?book_id=#{current_book.grandham_id}" : ''
    super(object, param) + book_path
  end

  def library_path(object, param = nil)
    book_path = current_book ? "?book_id=#{current_book.grandham_id}" : ''
    super(object, param) + book_path
  end
end
