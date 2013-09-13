PepperShaker.Router.map ()->
  @resource('session', ->
    @route('create');
    @route('destroy');
  )

  @resource('user', ->
    @route('create');
  )