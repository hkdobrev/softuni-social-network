Auth = ($window) ->
  username = $window.localStorage.getItem 'username'
  accessToken = $window.localStorage.getItem 'accessToken'

  saveToStorage = () ->
    $window.localStorage.setItem 'accessToken', accessToken
    $window.localStorage.setItem 'userName', username

  removeFromStorage = () ->
    $window.localStorage.removeItem 'accessToken'
    $window.localStorage.removeItem 'userName'

  @isLoggedIn = () ->
    !!accessToken

  @getUsername = () ->
    username

  @getAccessToken = () ->
    accessToken

  @setFromSession = (Session) ->
    username = Session.userName
    accessToken = Session.access_token
    saveToStorage()

  @destroy = () ->
    username = null
    accessToken = null
    removeFromStorage()

  this

Auth.$inject = ['$window']

angular
  .module('socialapp')
  .service('Auth', Auth)
