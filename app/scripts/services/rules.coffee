'use strict';

angular.module('wfApp').factory 'rules', ->
	rules_array = [
		["一次入力","住金","LP返却",null,"LP"]
		["一次入力",null,"完了","書類仕訳",null]
		["書類仕訳",null,"完了","二次入力","申請待ち"]
		[null,"申請待ち","申請",null,"承認待ち"]
		[null,"承認待ち","却下",null,"申請待ち"]
		["二次入力","承認待ち","承認","審査受付","申請待ち"]
		["審査受付","申請待ち","差戻","二次入力","申請待ち"]
		["審査受付","承認待ち","差戻","二次入力","申請待ち"]
		["審査受付","承認待ち","承認","業シス","連携中"]
		["業シス","連携中","完了","決裁登録","住金"]
		["決裁登録","住金","承認","結果確認","LP"]
		["結果確認","LP","確認","結果確認","完了"]
		["結果確認","LP","RG差戻","業シス","連携中"]
	]

	list = []

	for rule in rules_array
		list.push
			main: rule[0]
			sub: rule[1]
			action: rule[2]
			next_main: rule[3]
			next_sub: rule[4]

	select = (main,sub) ->
		ret = []
		for rule in list
			if rule.main is null or rule.main is main
				if rule.sub is null or rule.sub is sub
					ret.push rule
		ret

	actions = (main,sub) ->
		rule.action for rule in select(main,sub)

	action = (main,sub,action)->
		ret = {}
		for rule in select(main,sub)
			if rule.action is action
				ret.main = rule.next_main ? main
				ret.sub = rule.next_sub ? sub
		ret

	mainStates = ->
		ret = []
		for rule in list
			if rule.main not in ret and rule.main isnt null
				ret.push rule.main
		ret 

	subStates = ->
		ret = []
		for rule in list
			if rule.sub not in ret and rule.sub isnt null
				ret.push rule.sub
		ret

	{
		list: list
		select: select
		actions: actions
		action: action
		mainStates: mainStates
		subStates: subStates
	}
