PepperShaker.AuthSignInController = Em.ObjectController.extend
  email:    null
  password: null
  remember: false

  actions:
    login: ->
      PepperShaker.Auth.set('email', this.get('email'))
      PepperShaker.Auth.signIn
        data:
          email:    @get 'email'
          password: @get 'password'
          remember: @get 'remember'