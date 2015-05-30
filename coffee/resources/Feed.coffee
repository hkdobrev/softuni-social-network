angular
  .module('socialapp')
  .factory 'Feed', [
    '$resource',
    'BASE'
    ($resource, BASE) ->
      $resource "#{BASE}/me/feed",
        pageSize: 10
  ]
