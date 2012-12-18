class Ironman.Views.Index extends Backbone.View
  template: template("index")

  events:
    "click button": "startTraining"

  render: ->
    @$el.html @template(@)
    @

  startTraining: ->
    localStorage.setItem "startDate", (new Date())
    currentWeek = Ironman.currentWeek()
    Ironman.app.navigate "/weeks/#{currentWeek}", trigger: true

class Ironman.Views.Workouts extends Backbone.View
  tagName: "ul"
  className: "workouts"
  template: template("workouts")

  render: ->

    @addAll()
    @

  addAll: ->
    @collection.forEach @addOne, @

  addOne: (workout) ->
    workoutView = new Ironman.Views.Workout model: workout
    @$el.append workoutView.render().el

class Ironman.Views.Workout extends Backbone.View
  tagName: "li"
  className: "workout"
  template: template("workout")

  render: ->
    @$el.html @template(@model.toJSON())
    @

class Ironman.Views.WorkoutTitle extends Backbone.View
  tagName: "h3"
  template: template("workout-title")

  title: ->
    "Week #{@options.currentWeek}: #{Date.today().add(parseInt(@options.currentWeek)).weeks().monday().toString("MM/dd")} - #{Date.today().add(parseInt(@options.currentWeek) + 1).weeks().sunday().toString("MM/dd")}"

  render: ->
    @$el.html @template({ title: @title() })
    @
