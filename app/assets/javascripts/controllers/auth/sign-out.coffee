PepperShaker.AuthSignOutController = Em.Controller.extend
  needs: 'authSignIn'
  actions:
    cancel_logout: ->
      this.transitionToRoute('index')
    logout: ->
      PepperShaker.Auth.signOut()