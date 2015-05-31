FriendRequestCtrl = (FriendRequestUpdate) ->

  @approveRequest = (request) ->
    request.status = 'approved'
    FriendRequestUpdate.update
      id: request.id
      status: 'approved'

  @rejectRequest = (request) ->
    request.status = 'rejected'
    FriendRequestUpdate.update
      id: request.id
      status: 'rejected'

  return

FriendRequestCtrl.$inject = ['FriendRequestUpdate']

angular
  .module('socialapp')
  .controller('FriendRequestCtrl', FriendRequestCtrl)
