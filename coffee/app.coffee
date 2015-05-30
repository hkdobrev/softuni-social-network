app = angular.module 'socialapp', [
  'ngRoute'
  'ngResource'
]

app.value 'BASE', 'http://softuni-social-network.azurewebsites.net/api'
