class Ironman.Routers.App extends Backbone.Router
  initialize: ->
    @$mainEl = $("#main")

  routes:
    "": "index"
    "weeks/:id": "showWeek"

  index: ->
    view = new Ironman.Views.Index()
    @$mainEl.html view.render().el

  showWeek: (id) ->