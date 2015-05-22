gui = require('nw.gui')

currentShowDeck = 0

foo = ->
  #for test

  #Get context with jQuery - using jQuery's .get() method.
  ctx = $('#myChart').get(0).getContext('2d')
  #This will get the first returned node in the jQuery collection.
  data = 
    labels: [
      'January'
      'February'
      'March'
      'April'
      'May'
      'June'
      'July'
    ]
    datasets: [
      {
        fillColor: 'rgba(125,216,143,0.5)'
        strokeColor: 'rgba(125,216,143,1)'
        pointColor: 'rgba(125,216,143,1)'
        pointStrokeColor: '#fff'
        data: [
          65
          59
          90
          81
          56
          55
          40
        ]
      }
      {
        fillColor: 'rgba(151,187,205,0.5)'
        strokeColor: 'rgba(151,187,205,1)'
        pointColor: 'rgba(151,187,205,1)'
        pointStrokeColor: '#fff'
        data: [
          28
          48
          40
          19
          96
          27
          100
        ]
      }
    ]
  myNewChart = new Chart(ctx).Line(data)


$ ->
  # Show the window after all is ready
  gui.Window.get().show()
  currentTag = 0
  currentShowDeck = 1
  $('#btn-main').click ->
    if currentTag != 0
      currentTag = 0
      $('#sec-ship').hide()
      $('#sec-factory').hide()
      $('#sec-calc').hide()
      $('#sec-settings').hide()
      $('#sec-gamelog').hide()
      $('#sec-main').fadeIn()
  $('#btn-ship').click ->
    if currentTag != 1
      currentTag = 1
      $('#sec-main').hide()
      $('#sec-factory').hide()
      $('#sec-calc').hide()
      $('#sec-settings').hide()
      $('#sec-gamelog').hide()
      $('#sec-ship').fadeIn()
  $('#btn-factory').click ->
    if currentTag != 2
      currentTag = 2
      $('#sec-main').hide()
      $('#sec-ship').hide()
      $('#sec-calc').hide()
      $('#sec-settings').hide()
      $('#sec-gamelog').hide()
      $('#sec-factory').fadeIn()
  $('#btn-calc').click ->
    if currentTag != 3
      currentTag = 3
      $('#sec-main').hide()
      $('#sec-ship').hide()
      $('#sec-factory').hide()
      $('#sec-settings').hide()
      $('#sec-gamelog').hide()
      $('#sec-calc').fadeIn()
  $('#btn-settings').click ->
    if currentTag != 4
      currentTag = 4
      $('#sec-main').hide()
      $('#sec-ship').hide()
      $('#sec-factory').hide()
      $('#sec-calc').hide()
      $('#sec-gamelog').hide()
      $('#sec-settings').fadeIn()
  $('#btn-gamelog').click ->
    if currentTag != 5
      currentTag = 5
      $('#sec-main').hide()
      $('#sec-ship').hide()
      $('#sec-factory').hide()
      $('#sec-calc').hide()
      $('#sec-settings').hide()
      $('#sec-gamelog').fadeIn()  
      foo()   
  $('#exp-ship').change ->
    val = $(this).val().split(',')
    $('#exp-lv').val val[0]
    $('#exp-next').val val[1]
    $('#exp-goal').val val[2]
  $('#open-guide').click ->
    gui.Shell.openExternal 'http://poi.0u0.moe/guide'
  $('#open-advice').click ->
    gui.Shell.openExternal 'http://poi.0u0.moe/advice'
  $('#view-guide').click ->
    gui.Shell.openExternal 'http://poi.0u0.moe/guide'
  $('#exp-submit').click ->
    require('./modules/ui').calcExperience()

@showDeck = (deckId) ->
  $("#deck-#{currentShowDeck}").hide()
  $("#deck-#{deckId}").fadeIn()
  currentShowDeck = deckId

