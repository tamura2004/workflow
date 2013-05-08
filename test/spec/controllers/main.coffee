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

  it 'カレンダーが関数として定義されている。引数省略時は当月のカレンダーを返す。', ->
    expect(typeof scope.calender).toBe "function"

  it '要素は日付文字列であるが、初日のみmm/ddの形式で月数を持つ', ->
    expect(scope.calender()[0][3]).toBe "5/1"
    expect(scope.calender()[0][4]).toBe "2"


  it 'カレンダーは長さ７の配列の、長さ６の配列である。', ->
    expect(scope.calender().length).toBe 6
    expect(scope.calender()[0].length).toBe 7






