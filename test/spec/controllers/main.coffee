'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach module 'wfApp'

  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }

  it 'scope#total', ->
    for total in scope.total()
      expect(total.flag).toBeDefined()
      expect(total.state).toBeDefined()
      expect(total.num).toBeDefined()


