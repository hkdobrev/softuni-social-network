UserProvider = ($resource, BASE) ->
  $resource "#{BASE}/users/:username",
    username: '@username'

UserProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('User', UserProvider)
