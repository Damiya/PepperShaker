PepperShaker.Auth = Em.Auth.create
  signInEndPoint: '/users/sign_in'
  signOutEndPoint: '/users/sign_out'
  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'
  modules: ['emberData', 'actionRedirectable', 'authRedirectable', 'timeoutable', 'rememberable']
  rememberable:
    tokenKey: 'remember_token'
    period: 7 #days
    autoRecall: true
  actionRedirectable:
    signInRoute: 'index'
    signOutRoute: 'index'
  authRedirectable:
    route: 'sign-in'
  timeoutable:
    period: 60