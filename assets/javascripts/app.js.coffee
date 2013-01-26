@Ironman =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  started: ->
    if @startDate() then true else false

  startDate: ->
    if localStorage.getItem("startDate")
      new Date(localStorage.getItem("startDate"))

  saveWeek: (week) ->
    localStorage.setItem "week", parseInt(week)

  currentWeek: ->
    # now = (new Date()).getTime()
    # startTime = @startDate().getTime()
    # parseInt (now - startTime) / (24*3600*1000*7)
    parseInt(localStorage.getItem("week")) || 1

  getWorkoutsForWeek: (data, value) ->
    _.find(data.weeks, (week) ->
      week.week == value
    ).days

@template = (name) ->
  Handlebars.compile $("#" + name + "-template").html()