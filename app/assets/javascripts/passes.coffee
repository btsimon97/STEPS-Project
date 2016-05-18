# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#departure-time').datetimepicker({inline: true, sideBySide: true, showTodayButton: true, showClose: false, daysOfWeekDisabled:[0,6], format:'YYYY-MM-DD hh:mm A'});

  $('#return-time').datetimepicker({inline: true, sideBySide: true, showTodayButton: true, showClose: false, daysOfWeekDisabled:[0,6], format:'YYYY-MM-DD hh:mm A'});

  $(".pass_returning").change ->
    $(".return-student").toggleClass('display-none')

  $('#destination-select').change ->
    selected = $('#destination-select').val()
    if selected is 'Other'
      $("#destination-custom").prop('disabled', false)
      $('#specify-destination').removeClass('display-none')
    else
      $("#destination-custom").prop('disabled', true)
      $('#specify-destination').addClass('display-none')
