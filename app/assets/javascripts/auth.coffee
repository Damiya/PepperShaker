PepperShaker.Auth = Em.Auth.create
  signInEndPoint: '/users/sign-in'
  signOutEndPoint: '/users/sign-out'
  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  userModel: 'PepperShaker.User'
  modules: ['emberModel', 'actionRedirectable', 'authRedirectable', 'timeoutable', 'rememberable']
  rememberable:
    tokenKey: 'remember_token'
    period: 7 #days
    autoRecall: true
  actionRedirectable:
    signInRoute: 'index'
    signOutRoute: 'index'
  authRedirectable:
    route: 'auth.sign-in'
  timeoutable:
    period: 60