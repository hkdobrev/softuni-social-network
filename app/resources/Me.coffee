MeProvider = ($resource, BASE) ->
  $resource "#{BASE}/me"

MeProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Me', MeProvider)
