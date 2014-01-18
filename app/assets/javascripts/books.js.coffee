# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->

  $('.remove-button').click (event) ->
    associated_record       = $(@).closest('.associated-record')
    book_id                 = associated_record.data('bookid')
    associated_record_id    = associated_record.data('id')
    associated_record_type  = associated_record.data('type')
    associated_record_count = associated_record.data('count')

    status_string = "removed-#{associated_record_id}"

    $('.associated-record-changes').append($('<input>',
                                              {
                                                name: "#{associated_record_type}_removed_#{associated_record_count}",
                                                value: associated_record_id,
                                                type: 'hidden'
                                              }
                                            )
                                          )

    associated_record.remove()
    return false

  $('.add-new-field').click (event) ->

    associated_items = $(@).closest('.associated-record').find('.associated-item')
    count = $(@).data('recordlength') + 1
    $(@).data('recordlength', count)
    content = associated_items.first().wrap('<div/>').parent().html().replace(/_0_/g, "_#{count}_").replace(/\[0\]/g, "[#{count}]")

    associated_items.last().after(content)
    $(@).closest('.associated-record').find('.associated-item').last().find('input').val('')

    event.preventDefault()


  $('.associated-record').on('click', '.remove-field', ->
    if $(@).closest('.associated-record').find('.associated-item').length > 1
      $(@).closest('.associated-item').remove()
    else
      alert("Please add atleast one #{$(@).data('objecttype')}.")
    )