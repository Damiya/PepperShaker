PepperShaker.Auth = Ember.Auth.create(
  signInEndPoint: '/sign-in'
  signOutEndPoint: '/sign-out'
  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  userModel: 'PepperShaker.User'
  tokenLocation: 'authHeader'
  tokenHeaderKey: 'AUTH-TOKEN'
  sessionAdapter: 'localStorage'
  modules: ['authRedirectable', 'timeoutable']
  authRedirectable:
    route: 'sign-in'
  timeoutable:
    period: 60
);