PepperShaker.AuthSignInController = Em.ObjectController.extend
  email:    null
  password: null
  remember: false
  errors: null

  actions:
    login: ->
      PepperShaker.Auth.signIn(
        data:
          email:    @get 'email'
          password: @get 'password'
          remember: @get 'remember'
      )