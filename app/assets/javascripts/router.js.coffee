PepperShaker.Router.map ()->
  @resource('session', ->
    @route('new');
    @route('destroy');
  )