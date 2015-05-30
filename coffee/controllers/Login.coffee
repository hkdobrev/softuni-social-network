Login = (Session, Auth, $location) ->

  @login = (username, password) ->
    session = Session.save
      username: username
      password: password
      () ->
        Auth.setFromSession session
        $location.path '/'

  return

Login.$inject = ['Session', 'Auth', '$location']

angular
  .module('socialapp')
  .controller('Login', Login)
