PepperShaker.Auth = Ember.Auth.create(
  signInEndPoint: '/api/v1/session/create'
  signOutEndPoint: '/api/v1/session/destroy'
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