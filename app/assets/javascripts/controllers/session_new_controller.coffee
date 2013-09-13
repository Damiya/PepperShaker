PepperShaker.SessionCreateController = Ember.ObjectController.extend
  username: null
  password: null
  actions:
    login: ->
      _user = this.get('username')
      _pass = this.get('password')
      PepperShaker.Auth.signIn
        data:
          username: _user
          password: _pass
