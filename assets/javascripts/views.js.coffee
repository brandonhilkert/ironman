class Ironman.Views.Index extends Backbone.View
  template: template("index")

  events:
    "click button": "startTraining"

  render: ->
    @$el.html @template(@)
    @

  startTraining: ->
    localStorage.setItem "startDate", (new Date())
    week = Ironman.currentWeek()
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
  className: "title"
  template: template("workout-title")

  events:
    "click [data-behavior~='prev']": "goToPrevWeek"
    "click [data-behavior~='next']": "goToNextWeek"

  # title: ->
  #   "Week #{@options.week}: #{Date.today().add(parseInt(@options.week)).weeks().monday().toString("MM/dd")} - #{Date.today().add(parseInt(@options.week) + 1).weeks().sunday().toString("MM/dd")}"

  showPrevWeek: ->
    if @options.week is 1
      false
    else
      true

  goToPrevWeek: ->
    Ironman.app.navigate "/weeks/#{parseInt(@options.week) - 1}", trigger: true

  goToNextWeek: ->
    Ironman.app.navigate "/weeks/#{parseInt(@options.week) + 1}", trigger: true

  render: ->
    @$el.html @template({ week: @options.week, showPrevWeek: @showPrevWeek() })
    @
