# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$( document ).ready( ->
  $('#new_rest_day').submit( (event) ->
    implemented_on = $('#rest_day_implemented_on').val()
    employee_id = $('#rest_day_employee_id').val()
    url = "rest_days/unique_rest_day_per_employee?implemented_on=" + implemented_on + "&employee_id=" + employee_id
    ajax_validation_request(url, '#new_rest_day','#rest_day_implemented_on','Rest Day already taken at Period')

  ))