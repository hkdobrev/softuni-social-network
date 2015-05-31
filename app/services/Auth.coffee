Auth = ($window, $http, $rootScope, $location) ->

  updateAuth = () =>
    accessToken = @getAccessToken()
    @setAuthorizationHeader accessToken
    $rootScope.isLoggedIn = !!accessToken

  @isLoggedIn = () ->
    !!@getAccessToken()

  @getUsername = () ->
    $window.localStorage.getItem 'username'

  @getAccessToken = () ->
    $window.localStorage.getItem 'accessToken'

  @setFromSession = (session) ->
    $window.localStorage.setItem 'accessToken', session.access_token
    $window.localStorage.setItem 'username', session.userName
    updateAuth()

  @destroy = () ->
    $window.localStorage.removeItem 'accessToken'
    $window.localStorage.removeItem 'username'
    $http.defaults.headers.common.Authorization = undefined
    $rootScope.isLoggedIn = false

  @setAuthorizationHeader = (accessToken) ->
    accessToken = accessToken or @getAccessToken()
    if accessToken
      $http.defaults.headers.common.Authorization = 'Bearer ' + accessToken

  $rootScope.logout = () =>
    @destroy()
    $location.path '/login'

  updateAuth()

  this

Auth.$inject = ['$window', '$http', '$rootScope', '$location']

angular
  .module('socialapp')
  .service('Auth', Auth)
