# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  change_path_url = $('#change_form').attr('action')
  change_path_method = $('#change_form').attr('method')
  $('#type_id').change (event) ->
    type_id = $(this).val()

    $.ajax
      type: change_path_method
      url: change_path_url
      data: { type: { type_id: type_id}}
      dataType: 'html'
      success: (html) ->
        $('#food_table').html(html)
        return

    return

  return
