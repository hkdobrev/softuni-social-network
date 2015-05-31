FeedCtrl = (Feed, Post, Auth) ->
  @posts = Feed.query()

  @createOwnPost = (content) =>
    post = Post.save
      postContent: content
      username: Auth.getUsername()

  return

FeedCtrl.$inject = ['Feed', 'Post', 'Auth']

angular
  .module('socialapp')
  .controller('FeedCtrl', FeedCtrl)
