PepperShaker.SessionNewController = Ember.ObjectController.extend
  username: null
  password: null
  actions:
    login: (params) ->
      _user = this.get('username')
      _pass = this.get('password')
      PepperShaker.Auth.signIn
        data:
          username: _user
          password: _pass
