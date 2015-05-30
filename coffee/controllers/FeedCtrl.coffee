FeedCtrl = (Feed) ->
  @posts = Feed.query()

  return

FeedCtrl.$inject = ['Feed']

angular
  .module('socialapp')
  .controller('FeedCtrl', FeedCtrl)
