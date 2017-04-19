# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

  $('select#employee_id').selectize()

  current_employee_id = $('select#employee_id').val()

  $('#calendar').fullCalendar({
    eventSources: [{
      url: 'employee_attendance_report/get_full_calendar_data',
      data: {
        employee_id: current_employee_id
      },
      allDayDefault: false
    }]
  });