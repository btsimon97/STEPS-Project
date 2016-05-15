# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#students').dataTable(autoWidth: true, pagingType: 'full_numbers', processing: true)
  $('#courses').dataTable(autoWidth: true, pagingType: 'full_numbers', processing: true)
