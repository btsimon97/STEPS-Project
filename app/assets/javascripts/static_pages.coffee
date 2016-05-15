# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#courses').dataTable(pagingType: 'full_numbers', processing: true)
  $('#students').dataTable(pagingType: 'full_numbers', processing: true)
  $('#available-courses').dataTable(pagingType: 'full_numbers', processing: true)
