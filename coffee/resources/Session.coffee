SessionProvider = ($resource, BASE) ->
  $resource "#{BASE}/users/login"

SessionProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Session', SessionProvider)
