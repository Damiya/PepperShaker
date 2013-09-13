PepperShaker.UserCreateController = Ember.ObjectController.extend
  username: null
  password: null
  actions:
    create: ->
      _user = this.get('username')
      _pass = this.get('password')
      $.post('api/v1/user/create', {
          username: _user
          password: _pass
      })