
$ ->
  Date.prototype.addHours = (h) ->
    this.setHours(this.getHours() + h)
    this

  class self.TimeViewModel
    constructor: (call_on_change) ->
      @hours = ko.observable(0)
      @minutes = ko.observable(0)
      @hours.subscribe(call_on_change)
      @minutes.subscribe(call_on_change)

    add: (time) =>
      date = new Date(@milliseconds() + time.milliseconds())
      @hours(date.getHours())
      @minutes(date.getMinutes())

    milliseconds: =>
      (parseInt(@hours()) * 60 * 60 + parseInt(@minutes()) * 60) * 1000

    hour: =>
      parseInt(@hours())
    setHour: (v)=>
      @hours(v)

    minutes: =>
      parseInt(@minutes())
    setMinutes: (value) =>
      @minutes(value)

  class self.WorkDayViewModel
    constructor: ->
      @day = ko.observable()
      @working_time = ko.observable(8)
      @wastes = ko.observableArray([])
      @end = new TimeViewModel(@changeTime)

      @clock()
      $("input#start_at").timepicker(
        regional: "ru"
        showPeriodLabels: false
        showNowButton: true
        onClose: @changeTime
      )
      $("input#start_at").timepicker('setTime', (new Date()).toLocaleTimeString())
      @working_time.subscribe(@changeTime)
      @wastes.subscribe(@changeTime)
      @changeTime()

    clock: =>
      @day((new Date()).toLocaleTimeString())
      setTimeout(@clock, 1000)

    changeTime: =>
      start = new Date()
      start.setHours(parseInt($("input#start_at").timepicker('getHour')))
      start.setMinutes(parseInt($("input#start_at").timepicker('getMinute')))
      start.addHours(parseInt(@working_time()))
      $.each @wastes(), (idx, item) ->
        start.setTime(start.getTime() + item.milliseconds())
      @end.setHour(start.getHours())
      @end.setMinutes(start.getMinutes())

    addWaste: =>
      @wastes.push(new TimeViewModel(@changeTime))

    removeWaste: (item)=>
      @wastes.remove(item)

  ko.applyBindings(new WorkDayViewModel())
