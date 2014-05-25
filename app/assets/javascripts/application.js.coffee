
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require_tree .


$(document).ready ->
  $('#icon-selector li a').on('click', ->
    class_name = $(this).find('i').data('name')
    $('#category_icon_class').val(class_name)
    $('#icon_display').attr('class', class_name)
    console.log class_name
  )
  return
