PepperShaker.Router.map ->
  @resource 'champions', ->
    @route 'show', {path: '/:champion_id'}
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}
  @resource 'auth', ->
    @route 'sign-in'
    @route 'sign-out'