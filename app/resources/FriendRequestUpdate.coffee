FriendRequestUpdateProvider = ($resource, BASE) ->
  $resource "#{BASE}/me/requests/:id", {
    id: '@id'
    status: '@status'
  },
    update:
      method: 'PUT'

FriendRequestUpdateProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('FriendRequestUpdate', FriendRequestUpdateProvider)
