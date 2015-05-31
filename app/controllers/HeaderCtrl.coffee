HeaderCtrl = (Me, FriendRequest) ->

  @me = Me.get()
  @requests = FriendRequest.query()

  return

HeaderCtrl.$inject = ['Me', 'FriendRequest']

angular
  .module('socialapp')
  .controller('HeaderCtrl', HeaderCtrl)
