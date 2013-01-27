class Ironman.Models.Workout extends Backbone.Model
  initialize: ->
    @.set "dayOfWeek", @dayOfWeek()

  dayOfWeek: ->
    dayNames = new Array("Su","M","T","W","Th","F","Sa")

    if @.get("day") == 7
      dayNames[0]
    else
      dayNames[@.get("day")]

class Ironman.Collections.Workouts extends Backbone.Collection
  model: Ironman.Models.Workout

