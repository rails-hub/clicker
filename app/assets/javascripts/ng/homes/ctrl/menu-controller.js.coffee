angular.module('Clicker.controllers').controller 'MenuCtrl', ($scope)->

  $scope.init = ()->
    $scope.siteName = "Clickers"
    $scope.headers = ["Home", "Courses"]


  $scope.init()