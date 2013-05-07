'use strict';

angular.module('wfApp').factory 'claims', ->
	init = [
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
		["一次入力","住金"]
	]

	list = []

	reset = ->
		for v,i in init
			list.push
				id: ("0000" + i).slice(-4)
				main: v[0]
				sub: v[1]

	reset()

	total = ->
		work = {}
		orders = ["一次入力","書類仕訳","二次入力","審査受付","業シス","決裁登録","結果確認","全件"]
		for order in orders
			work[order] = 0

		for claim in list
			work[claim.main] += 1
			work["全件"] += 1

		ret = []
		for order in orders
			ret.push
				state: order
				num: work[order]
		ret

	{
		list: list
		reset: reset
		total: total
	}
