# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $('.add-new-field').click (event) ->
    associated_items = $(@).closest('.associated-record').find('.associated-item')
    count = $(@).data('recordlength') + 1
    $(@).data('recordlength', count)
    content = associated_items.first().wrap('<div/>').parent().html().replace(/_0_/g, "_#{count}_").replace(/\[0\]/g, "[#{count}]")

    associated_items.last().after(content)
    $(@).closest('.associated-record').find('.associated-item').last().find('input').val('')

    event.preventDefault()


  $('.associated-record').on('click', '.remove-field', ->
    $(@).closest('.associated-item').remove()
    )