angular.module('Clicker.controllers').controller 'HeaderCtrl', ($scope)->

  $scope.init = ()->
    $scope.siteName = "Clickers"
    $scope.headers = ["Home", "Courses"]


  $scope.init()