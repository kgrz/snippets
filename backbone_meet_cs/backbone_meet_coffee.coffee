jQuery ->
  class ListView extends Backbone.View
    el: $('body')
    initialize: ->
      _.bindAll @
      @counter = 0
      @render()
    render: ->
      $(@el).append('<ul><li>Hello, Backbone</li></ul>')
      $(@el).append('<ul></ul>')
    addItem: ->
      @counter++
      $('ul').append "<li>Hello, Backbone #{counter}!</li>"
    events: 'click button': 'addItem'

  list_view = new ListView
