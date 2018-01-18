'use strict';


var App = angular.module('myApp',[
	'ngRoute',
	'ui.router',
	'MonsterController',
	'MonsterController2'
    ]);

App.value('battles',[]); 

App.value('bgcolor',{}); 

