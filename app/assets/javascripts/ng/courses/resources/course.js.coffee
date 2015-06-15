angular.module('Clicker.factories').factory 'Course', (railsResourceFactory)->
  Courses = railsResourceFactory({
    url: '/courses/{{course_id}}/add'
    name: ' course_add'
  })

  Courses