UserCtrl = (user, Wall) ->
  @user = user
  @posts = Wall.query
    username: user.username

  return

UserCtrl.$inject = ['user', 'Wall']

angular
  .module('socialapp')
  .controller('UserCtrl', UserCtrl)
