PepperShaker.Router.reopen
  didTransition: (infos) ->
    this._super infos;
    if window._gaq == undefined
      return

    Ember.run.next ->
      _gaq.push(['_trackPageview', window.location.hash.substr(1)])


PepperShaker.Router.map ->
  @resource 'champions', ->
    @route 'show', {path: '/:champion_id'}
  @resource 'auth', ->
    @route 'sign-in'
    @route 'sign-out'
    @route 'register'