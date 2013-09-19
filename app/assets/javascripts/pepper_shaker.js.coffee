PepperShaker = window.PepperShaker = Ember.Application.create();
PepperShaker.API = {
  endPoint: '/api/v1'
}

#= require ./store
#= require_tree ./models
#= require_tree ./controllers
#= require_tree ./views
#= require_tree ./helpers
#= require_tree ./templates
#= require_tree ./routes
#= require ./router
#= require ./auth
#= require_self
