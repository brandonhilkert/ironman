@Ironman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

@template = (name) ->
  Handlebars.compile $("#" + name + "-template").html()