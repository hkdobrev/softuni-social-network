Homepage = (Session, Auth) ->

  @login = (username, password) ->
    session = Session.save
      username: username
      password: password
      () ->
        Auth.setFromSession session

  return

Homepage.$inject = ['Session', 'Auth']

angular
  .module('socialapp')
  .controller('Homepage', Homepage)
