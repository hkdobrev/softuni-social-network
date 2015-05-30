Homepage = (Session, $window) ->

  @login = (username, password) ->
    session = Session.save
      username: username
      password: password
      () ->
        $window.localStorage.setItem('accessToken', session.access_token)
        $window.localStorage.setItem('userName', session.username)

  return

Homepage.$inject = ['Session', '$window']

angular
  .module('socialapp')
  .controller('Homepage', Homepage)
