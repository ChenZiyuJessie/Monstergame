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
<body ng-app="myApp" class="ng-cloak" style="background:{{bgcolor}};">
	<div class="generic-container" ng-controller="MonsterController as ctrl">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Monster Registration Form </span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal">
					<input type="hidden" ng-model="ctrl.monster.id" />
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="mname">Name</label>
							<div class="col-md-7">
								<input type="text" ng-model="ctrl.monster.monstername" name="mname"
									class="monstername form-control input-sm"
									placeholder="Enter monster's name" required ng-minlength="3" />
								<div class="has-error" ng-show="myForm.mname.$dirty">
									<span ng-show="myForm.mname.$error.required">This is a
										required field</span> <span ng-show="myForm.mname.$error.minlength">Minimum
										length required is 3</span> <span ng-show="myForm.mname.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="health">Health</label>
							<div class="col-md-7">
								<input type="number" ng-model="ctrl.monster.health" name="health"
									class="health form-control input-sm"
									placeholder="Enter monster's Health." required min="1"/>
								<div class="has-error" ng-show="myForm.health.$dirty">
									<span ng-show="myForm.health.$error.required">This is a
										required field</span> <span ng-show="myForm.health.$error.min">Minimum
										value required is 1</span> <span ng-show="myForm.health.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="attack">Attack</label>
							<div class="col-md-7">
								<input type="number" ng-model="ctrl.monster.attack" name="attack"
									class="health form-control input-sm"
									placeholder="Enter monster's Attack." required min="1"/>
								<div class="has-error" ng-show="myForm.attack.$dirty">
									<span ng-show="myForm.attack.$error.required">This is a
										required field</span> <span ng-show="myForm.attack.$error.min">Minimum
										value required is 1</span> <span ng-show="myForm.attack.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-lable" for="type">Attribute</label>
							<div class="col-md-7">
								<select ng-model="ctrl.monster.type" name="type" ng-options="x.id as x.name for x in types"
									class="health form-control input-sm"
									placeholder="Enter monster's Type.">
								</select>
								<div class="has-error" ng-show="myForm.type.$dirty">
									<span ng-show="myForm.type.$error.required">This is a
										required field</span> <span ng-show="myForm.type.$error.min">Minimum
										value required is 1</span> <span ng-show="myForm.type.$invalid">This
										field is invalid </span>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="{{!ctrl.monster.id ? 'Add' : 'Update'}}"
								class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
							<button type="button" ng-click="ctrl.reset()"
								class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset
								Form</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="panel panel-default">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">List of Monsters </span>
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
							<th><button type="button" ng-click="ctrl.battle()"
									class="btn btn-success custom-width">Battle</button></th>
							<th width="20%"></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="m in ctrl.monsters">
							<td><span ng-bind="m.id"></span></td>
							<td><span ng-bind="m.monstername"></span></td>
							<td><span ng-bind="m.health"></span></td>
							<td><span ng-bind="m.attack"></span></td>
							<td>
								<span ng-if="m.type==1">fire Attribute</span>
								<span ng-if="m.type==2">water Attribute</span>
								<span ng-if="m.type==3">earth Attribute</span>
							</td>
							<td>
								<button type="button" ng-click="ctrl.edit(m.id)"
									class="btn btn-success custom-width">Edit</button>
								<button type="button" ng-click="ctrl.remove(m.id)"
									class="btn btn-danger custom-width">Remove</button>
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