FriendsProvider = ($resource, BASE) ->
  $resource "#{BASE}/me/friends"

FriendsProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Friends', FriendsProvider)
