PepperShaker.AuthSignOutController = Em.Controller.extend
  needs: 'authSignIn'
  actions:
    cancel_logout: ->

    logout: ->
      PepperShaker.Auth.signOut