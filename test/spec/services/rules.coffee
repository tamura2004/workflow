'use strict'

describe 'Service: rules', () ->

  # load the service's module
  beforeEach module 'wfApp'

  # instantiate service
  rules = {}
  beforeEach inject (_rules_) ->
    rules = _rules_

  it 'rules#list', ->
    expect(angular.isArray(rules.list)).toBeTruthy()
    for rule in rules.list
      for key, value of rule
        expect(["main","sub","action","next_main","next_sub"]).toContain key

  it 'rules#select', ->
    list = rules.select("審査受付","承認待ち")
    expect(angular.isArray(list)).toBeTruthy()
    for rule in list
      for key, value of rule
        expect(["main","sub","action","next_main","next_sub"]).toContain key

  it 'rules#actions', ->
    expect(rules.actions("審査受付","申請待ち")).toEqual ["申請","差戻"]
    expect(rules.actions("審査受付","承認待ち")).toEqual ["却下","差戻","承認"]

  it 'rules#acion', ->
    expect(rules.action("一次入力","住金","LP返却").main).toBe "一次入力"
    expect(rules.action("一次入力","住金","LP返却").sub).toBe "LP"
    expect(rules.action("審査受付","申請待ち","差戻").main).toBe "二次入力"
    expect(rules.action("審査受付","申請待ち","差戻").sub).toBe "申請待ち"
    expect(rules.action("審査受付","承認待ち","却下").main).toBe "審査受付"
    expect(rules.action("審査受付","承認待ち","却下").sub).toBe "申請待ち"

  it 'rules#mainStateはnullを含まず、uniqueである', ->
    mainStates = rules.mainStates()
    memory = []
    for mainState in mainStates
      expect(mainState).not.toBeNull()
      expect(mainState in memory).toBeFalsy()
      memory.push mainState

  it 'rules#subStateはnullを含まず、uniqueである', ->
    subStates = rules.subStates()
    memory = []
    for subState in subStates
      expect(subState).not.toBeNull()
      expect(subState in memory).toBeFalsy()
      memory.push subState

  it '結果確認/完了を除き、ひとつ以上の選択可能アクションを持つ', ->
    for rule in rules.list
      main = rule.next_main ? rule.main
      sub = rule.next_sub ? rule.sub
      if main isnt null and sub isnt null
        if main is "結果確認" and sub is "完了"
          expect(rules.actions(main,sub).length).toBe 0
        else
          expect(rules.actions(main,sub).length).toBeGreaterThan 0
