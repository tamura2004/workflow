'use strict'

angular.module('wfApp',[])
.controller 'MainCtrl', ($scope,rules,claims) ->

	$scope.current_claim = {}
	$scope.current_state = "全件"

	$scope.total = ->
		ret = []
		for t in claims.total()
			if t.state is $scope.current_state
				t.flag = true
			else
				t.flag = false
			ret.push t
		ret

	$scope.claims = ->
		ret = []
		for claim in claims.list
			if claim.id is $scope.current_claim.id
				claim.flag = true
			else
				claim.flag = false
			ret.push claim
		ret

	$scope.setState = (total) ->
		$scope.current_state = total
		$scope.current_claim = {}


	$scope.query = ->
		if $scope.current_state is "全件"
			""
		else
			$scope.current_state

	$scope.subtitle = ->
		$scope.current_state

	$scope.table = -> "table table-bordered table.table-condensed"

	$scope.setClaim = (claim) ->
		$scope.current_claim = claim

	$scope.buttons = ->
		c = $scope.current_claim
		rules.actions(c.main,c.sub)

	$scope.action = (action) ->
		c = $scope.current_claim
		next = rules.action(c.main,c.sub,action)
		if c.main isnt next.main
			c[c.main] = "済"
		c.main = next.main
		c.sub = next.sub

	$scope.btnClass = (button) ->
		if button in ["却下","差戻","LP返却","RG差戻"]
			"btn-danger"
		else
			""
	$scope.isCurrentMain = (main) ->
		if $scope.current_claim.main is main
			"active"
		else
			""

