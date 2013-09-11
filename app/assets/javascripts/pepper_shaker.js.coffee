PepperShaker = window.PepperShaker = Ember.Application.create();

Ember.EasyForm.Config.registerWrapper('default', {
  formClass: 'form-signin',
  fieldErrorClass: 'error',
  errorClass: 'help-inline',
  hintClass: 'help-block',
  labelClass: '',
  inputClass: 'form-control',
  wrapControls: false,
  controlsWrapperClass: ''
});

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
