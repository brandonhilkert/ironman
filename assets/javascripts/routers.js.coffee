class Ironman.Routers.App extends Backbone.Router
  initialize: (data) ->
    @$mainEl = $("#main")
    Ironman.data = data

  routes:
    "": "index"
    "weeks/:id": "showWeek"

  index: ->
    if Ironman.started()
      currentWeek = Ironman.currentWeek()
      currentWeek = 1 if currentWeek is 0
      Ironman.app.navigate "/weeks/#{currentWeek}", trigger: true
    else
      view = new Ironman.Views.Index()
      @$mainEl.html view.render().el

  showWeek: (id) ->
    currentWeek = parseInt id
    dataWorkouts = Ironman.getWorkoutsForWeek Ironman.data, currentWeek
    Ironman.workouts = new Ironman.Collections.Workouts(dataWorkouts)

    titleView = new Ironman.Views.WorkoutTitle currentWeek: id
    @$mainEl.html titleView.render().el

    workoutsView = new Ironman.Views.Workouts collection: Ironman.workouts
    @$mainEl.append workoutsView.render().el
