attr = Ember.attr

PepperShaker.User = Ember.Model.extend
  username: attr
  email: attr
  admin: attr

PepperShaker.User.url = PepperShaker.API.endPoint + '/user'
PepperShaker.User.adapter = Ember.RESTAdapter.create()