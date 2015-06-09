angular.module('Telcoedge.controllers').controller 'MenuCtrl', ($scope)->

  $scope.init = ()->
    $scope.siteName = "TelcoEdge"
    $scope.headers = ["Home", "Test Numbers", "FAQ", "Our Services", "Contact Us", "About Us"]


  $scope.init()