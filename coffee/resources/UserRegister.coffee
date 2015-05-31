UserRegisterProvider = ($resource, BASE) ->
  $resource "#{BASE}/users/register"

UserRegisterProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('UserRegister', UserRegisterProvider)
