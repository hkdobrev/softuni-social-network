PostProvider = ($resource, BASE) ->
  $resource "#{BASE}/posts"

PostProvider.$inject = ['$resource', 'BASE']

angular
  .module('socialapp')
  .factory('Post', PostProvider)
