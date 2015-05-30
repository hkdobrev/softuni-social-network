angular
  .module('socialapp')
  .factory 'UserRegister', [
    '$resource',
    'BASE'
    ($resource, BASE) ->
      $resource "#{BASE}/users/register"
  ]
