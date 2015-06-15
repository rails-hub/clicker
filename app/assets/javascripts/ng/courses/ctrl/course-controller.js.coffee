angular.module('Clicker.controllers').controller 'CourseCtrl', ($scope, Course)->

  $scope.add_course = (courseId) ->
    params = {  }
    course = new Course(course_id: courseId)
    course.save().then (r)->
      document.getElementById("addCourse_"+courseId).innerHTML = "Added"



