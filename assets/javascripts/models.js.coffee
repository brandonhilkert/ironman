class Ironman.Models.Workout extends Backbone.Model
  initialize: ->
    @.set "isToday", @isToday()
    @.set "dayOfWeek", @dayOfWeek()

  isToday: ->
    Date.today().getDay() == @get("day")

  dayOfWeek: ->
    dayNames = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")

    if @.get("day") == 7
      dayNames[0]
    else
      dayNames[@.get("day")]

class Ironman.Collections.Workouts extends Backbone.Collection
  model: Ironman.Models.Workout

