WallProvider = ($resource, BASE) ->
  $resource "#{BASE}/users/:username/wall",
    username: '@username'
    pageSize: 10

WallProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Wall', WallProvider)
