angular
  .module('socialapp')
  .factory 'Session', [
    '$resource',
    'BASE'
    ($resource, BASE) ->
      $resource "#{BASE}/users/login"
  ]
