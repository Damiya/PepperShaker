PepperShaker.AuthSignOutController = Em.Controller.extend
  needs: 'authSignIn'
  actions:
    cancel_logout: ->

    logout: ->
      PepperShaker.Auth.signOut
        data:
          email: PepperShaker.Auth.get('email')