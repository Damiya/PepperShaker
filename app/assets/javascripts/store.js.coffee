PepperShaker.AuthenticatedRESTAdapter = DS.Adapter.extend(
  ajax: (url, type, hash) ->
    hash = hash || {};
    hash.headers = hash.headers || {};
    hash.headers['X-AUTHENTICATION-TOKEN'] = PepperShaker.Store.authToken;
    return this._super(url,type,hash);
)

PepperShaker.Store = DS.Store.extend
  authToken: null
  revision: 11
  adapter: DS.RESTAdapter.create()

