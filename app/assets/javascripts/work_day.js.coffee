
$ ->
  class self.WorkDayViewModel
    constructor: ->
      @day = ko.observable()
      @clock()

    clock: =>
      @day((new Date()).toLocaleTimeString())
      setTimeout(@clock, 1000)


  ko.applyBindings(new WorkDayViewModel())
