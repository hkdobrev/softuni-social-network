AuthCtrl = (Session, Auth, UserRegister, $location) ->

  @login = (username, password) ->
    session = Session.save
      username: username
      password: password
      () ->
        Auth.setFromSession session
        $location.path '/'

    return

  @register = (username, password, confirmPassword, name, email) ->
    session = UserRegister.save
      username: username
      password: password
      confirmPassword: confirmPassword
      name: name
      email: email
      () ->
        Auth.setFromSession session
        $location.path '/'

    return

  return

AuthCtrl.$inject = ['Session', 'Auth', 'UserRegister', '$location']

angular
  .module('socialapp')
  .controller('AuthCtrl', AuthCtrl)
