jQuery ->
  class window.Album extends Backbone.Model
    isFirstTrack: (index) ->
      return index == 0
    isLastTrack: (index) ->
      index >= @get('tracks').length-1
    trackUrlAtIndex: (index) ->
      if (@get('tracks').length >= index)
        @get('tracks')[index].url
      else
        null
  class window.Albums extends Backbone.Collection
    model: Album
    url: '/albums'

  class window.AlbumView extends Backbone.View
    tagName: 'li'
    className: 'album'
    initialize: ->
      _.bindAll @, 'render'
      @model.bind('change', @render)
      @template = _.template($('#album-template').html())
    render: ->
        renderedContent = @template(@model.toJSON())
        $(@el).html(renderedContent)
        @

  class window.LibraryAlbumView extends AlbumView

  class window.LibraryView  extends Backbone.View
    intialize: ->
      _.bindAll @, 'render'
      @tenplate = _.template($('#library-template').html())
    render: ->
      $(@el).html(@template)
