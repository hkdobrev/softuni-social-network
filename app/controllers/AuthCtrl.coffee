AuthCtrl = (Session, Auth, UserRegister, $location) ->

  @login = (username, password) =>
    session = Session.save
      username: username
      password: password
      () ->
        Auth.setFromSession session
        $location.path '/'
      (httpResponse) =>
        @loginError = httpResponse.data.error_description

    return

  @register = (username, password, confirmPassword, name, email) =>
    session = UserRegister.save
      username: username
      password: password
      confirmPassword: confirmPassword
      name: name
      email: email
      () ->
        Auth.setFromSession session
        $location.path '/'
      (httpResponse) =>
        @registerError = httpResponse.data.message

    return

  return

AuthCtrl.$inject = ['Session', 'Auth', 'UserRegister', '$location']

angular
  .module('socialapp')
  .controller('AuthCtrl', AuthCtrl)
