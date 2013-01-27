class Ironman.Routers.App extends Backbone.Router
  initialize: (data) ->
    @$mainEl = $("#main")
    Ironman.data = data

  routes:
    "": "index"
    "weeks/:id": "showWeek"

  index: ->
    # if Ironman.started()
    #   currentWeek = Ironman.currentWeek()
    #   currentWeek = 1 if currentWeek is 0
    #   Ironman.app.navigate "/weeks/#{currentWeek}", trigger: true
    # else
      # view = new Ironman.Views.Index()
      # @$mainEl.html view.render().el
    Ironman.app.navigate "/weeks/#{Ironman.currentWeek()}", trigger: true

  showWeek: (id) ->
    Ironman.saveWeek(id)
    dataWorkouts = Ironman.getWorkoutsForWeek Ironman.data, Ironman.currentWeek()
    Ironman.workouts = new Ironman.Collections.Workouts(dataWorkouts)

    window.titleView = new Ironman.Views.WorkoutTitle week: Ironman.currentWeek()
    @$mainEl.html titleView.render().el

    workoutsView = new Ironman.Views.Workouts collection: Ironman.workouts
    @$mainEl.append workoutsView.render().el
