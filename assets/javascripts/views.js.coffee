class Ironman.Views.Index extends Backbone.View
  template: template("index")

  events:
    "click button": "startTraining"

  render: ->
    @$el.html @template(@)
    @

  startTraining: ->
