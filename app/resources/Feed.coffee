FeedProvider = ($resource, BASE) ->
  $resource "#{BASE}/me/feed",
    pageSize: 10

FeedProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Feed', FeedProvider)
