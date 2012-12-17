class Grocery.Models.List extends Backbone.Model
  url: ->
    "/lists"

class Grocery.Models.Item extends Backbone.Model

class Grocery.Collections.Items extends Backbone.Collection
  initialize: (models, options) ->
    @listId = options.listId

  model: Grocery.Models.Item

  url: ->
    "/lists/" + @listId + "/items"