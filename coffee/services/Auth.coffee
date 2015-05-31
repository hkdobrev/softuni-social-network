Auth = ($window, $http) ->

  @isLoggedIn = () ->
    !!@getAccessToken()

  @getUsername = () ->
    $window.localStorage.getItem 'username'

  @getAccessToken = () ->
    $window.localStorage.getItem 'accessToken'

  @setFromSession = (session) ->
    $window.localStorage.setItem 'accessToken', session.access_token
    $window.localStorage.setItem 'username', session.userName
    @setAuthorizationHeader()

  @destroy = () ->
    $window.localStorage.removeItem 'accessToken'
    $window.localStorage.removeItem 'username'
    $http.defaults.headers.common.Authorization = undefined

  @setAuthorizationHeader = (accessToken) ->
    accessToken = accessToken or @getAccessToken()
    if accessToken
      $http.defaults.headers.common.Authorization = 'Bearer ' + accessToken

  this

Auth.$inject = ['$window', '$http']

angular
  .module('socialapp')
  .service('Auth', Auth)
