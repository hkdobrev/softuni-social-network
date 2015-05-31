FriendRequestsProvider = ($resource, BASE) ->
  $resource "#{BASE}/me/requests"

FriendRequestsProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('FriendRequest', FriendRequestsProvider)
