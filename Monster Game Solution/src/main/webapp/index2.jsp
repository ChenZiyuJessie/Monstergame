<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Monster Battle</title>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>

</head>
<body ng-app="myApp" class="ng-cloak" style="background:red;">
	<div class="generic-container" ng-controller="MonsterController2 as ctrl">
		<div class="panel panel-default" ng-if="battle==1">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Choice of First </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>check</th>
							<th>ID.</th>
							<th>Name</th>
							<th>Health</th>
							<th>Attack</th>
							<th>Attribute</th>
							<th><button type="button" ng-click="ctrl.next()"
									class="btn btn-success custom-width">Next</button></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="m in ctrl.monsters">
						<!-- id='monster' name='monster' ng-checked="isSelected(m.id)" ng-click="updateSelection($event,m.id)"/></th> -->
							<th><input type="radio" id='monster' name='monster' ng-click="ctrl.check(m)"/></th>
							<td><span ng-bind="m.id"></span></td>
							<td><span ng-bind="m.monstername"></span></td>
							<td><span ng-bind="m.health"></span></td>
							<td><span ng-bind="m.attack"></span></td>
							<td>
								<span ng-if="m.type==1">fire Attribute</span>
								<span ng-if="m.type==2">water Attribute</span>
								<span ng-if="m.type==3">earth Attribute</span>
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		
		<div class="panel panel-default" ng-if="battle==2">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Choice of The second </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>check</th>
							<th>ID.</th>
							<th>Name</th>
							<th>Health</th>
							<th>Attack</th>
							<th>Attribute</th>
							<th><button type="button" ng-click="ctrl.next()"
									class="btn btn-success custom-width">Next</button></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="m in ctrl.monsters">
							<th><input type="radio" ng-click="ctrl.check(m)" id='monster1' name='monster1'/></th>
							<td><span ng-bind="m.id"></span></td>
							<td><span ng-bind="m.monstername"></span></td>
							<td><span ng-bind="m.health"></span></td>
							<td><span ng-bind="m.attack"></span></td>
							<td>
								<span ng-if="m.type==1">fire Attribute</span>
								<span ng-if="m.type==2">water Attribute</span>
								<span ng-if="m.type==3">earth Attribute</span>
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="panel panel-default" ng-if="battle==3">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Confirmation Page </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID.</th>
							<th>Name</th>
							<th>Health</th>
							<th>Attack</th>
							<th>Attribute</th>
							<th><button type="button" ng-click="ctrl.start()"
									class="btn btn-success custom-width">Start</button></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="m in ctrl.battles">
							<td><span ng-bind="m.id"></span></td>
							<td><span ng-bind="m.monstername"></span></td>
							<td><span ng-bind="m.health"></span></td>
							<td><span ng-bind="m.attack"></span></td>
							<td>
								<span ng-if="m.type==1">fire Attribute</span>
								<span ng-if="m.type==2">water Attribute</span>
								<span ng-if="m.type==3">earth Attribute</span>
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="panel panel-default" ng-if="battle==4">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">Result </span>
			</div>
			
			<div class="tablecontainer">
				<div class="panel-heading">
					<span class="lead">{{ctrl.result}} </span>
				</div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>ID.</th>
							<th>Name</th>
							<th>Health</th>
							<th>Attack</th>
							<th>Attribute</th>
							<th><button type="button" ng-click="ctrl.finish()"
									class="btn btn-success custom-width">Finish</button></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="m in ctrl.results">
							<td><span ng-bind="m.id"></span></td>
							<td><span ng-bind="m.monstername"></span></td>
							<td><span ng-bind="m.health"></span></td>
							<td><span ng-bind="m.attack"></span></td>
							<td>
								<span ng-if="m.type==1">fire Attribute</span>
								<span ng-if="m.type==2">water Attribute</span>
								<span ng-if="m.type==3">earth Attribute</span>
							</td>
							
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<script
		src="<c:url value='/static/js/angular.js' />"></script>
		<script src="<c:url value='/static/js/angular-ui-router.min.js' />"></script>
	<script src="<c:url value='/static/js/angular-route.js' />"></script>
	<script src="<c:url value='/static/js/controller/monster_controller.js' />"></script>
	<script src="<c:url value='/static/js/controller/monster_controller2.js' />"></script>
	<script
		src="<c:url value='/static/js/angular.min.js' />"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
	<script src="<c:url value='/static/js/service/monster_service.js' />"></script>
	<script
		src="<c:url value='/static/js/controller/monster_controller.js' />"></script>
</body>
</html>