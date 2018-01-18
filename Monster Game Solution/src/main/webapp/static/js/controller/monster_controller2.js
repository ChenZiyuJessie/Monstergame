'use strict';


var MonsterController2 = angular.module('MonsterController2', []);

MonsterController2.controller('MonsterController2', [
		'$scope',
		'MonsterService','$window', 'battles', 'bgcolor',
		function($scope, MonsterService,$window ,battles, bgcolor) {
			$scope.types = [
			                {name:'fire Attribute',id:1},
			                {name:'water Attribute',id:2},
			                {name:'soil Attribute',id:3}
			            ];
			var self = this;
			self.monster = {
				id : null,
				monstername : '',
				health : '',
				attack : ''
			};
			self.monsters = [];

			self.fetchAllMonsters = function() {
				MonsterService.fetchAllMonsters().then(function(d) {
					self.monsters = d;
				}, function(errResponse) {
					console.error('Error while fetching Monsters');
				});
			};

			self.createMonster = function(monster) {
				MonsterService.createMonster(monster).then(
						self.fetchAllMonsters, function(errResponse) {
							console.error('Error while creating Monster.');
						});
			};

			self.updateMonster = function(monster, id) {
				MonsterService.updateMonster(monster, id).then(
						self.fetchAllMonsters, function(errResponse) {
							console.error('Error while updating Monster.');
						});
			};

			self.deleteMonster = function(id) {
				MonsterService.deleteMonster(id).then(self.fetchAllMonsters,
						function(errResponse) {
							console.error('Error while deleting Monster.');
						});
			};

			self.fetchAllMonsters();

			self.submit = function() {
				if (self.monster.id === null) {
					console.log('Saving New Monster', self.monster);
					self.createMonster(self.monster);
				} else {
					self.updateMonster(self.monster, self.monster.id);
					console.log('Monster updated with id ', self.monster.id);
				}
				self.reset();
			};

			self.edit = function(id) {
				console.log('id to be edited', id);
				for (var i = 0; i < self.monsters.length; i++) {
					if (self.monsters[i].id === id) {
						self.monster = angular.copy(self.monsters[i]);
						break;
					}
				}
			};

			self.remove = function(id) {
				console.log('id to be deleted', id);
				if (self.monster.id === id) {// clean form if the monster to
					// be
					// deleted is shown there.
					self.reset();
				}
				self.deleteMonster(id);
			};

			self.reset = function() {
				self.monster = {
					id : null,
					monstername : '',
					health : '',
					attack : ''
				};
				$scope.myForm.$setPristine(); // reset Form
			};
			
			$scope.battle = 1;
			self.battles = [];
			self.next = function() {
				if(self.battles.length==0){
					alert('Please One Choice!');
					return;
				}
				if(self.battles.length==1 && $scope.battle ==2){
					alert('Please Second Choice!');
					return;
				}
				$scope.battle ++;
				self.battles = battles
			};
			
		    $scope.selectedTags = [];
		    
		    var updateSelected = function(action,id,name){
		        if(action == 'add' && battles.indexOf(id) == -1){
		            battles.push(id);
		            $scope.selectedTags.push(name);
		        }
		        if(action == 'remove' && battles.indexOf(id)!=-1){
		            var idx = battles.indexOf(id);
		            battles.splice(idx,1);
		            $scope.selectedTags.splice(idx,1);
		        }
		    }

		    $scope.updateSelection = function($event, id){
		        var checkbox = $event.target;
		        var action = (checkbox.checked?'add':'remove');
		        updateSelected(action,id,checkbox.name);
		    }

		    $scope.isSelected = function(id){
		        return battles.indexOf(id)>=0;
		    }

			self.check = function(m) {
				if(battles.indexOf(m) == -1){
					battles.push(m);
				}else{
					alert('Please do not repeat selection!');
				}
				self.battles = battles;
			};
			//start
			self.start = function() {
				if(self.battles.length <=1){
					alert('Please Second Choice!');
					return;
				}
				
				$scope.battle ++;
				self.results = [];
				var run = true;
				var index = 0;
				//火 1 水 2 土3
				//火怕水 1
				//水怕土 2
				//土怕火 3
				//相克的属性攻击力额外加150%
				var a = battles[0];
				var b = battles[1];
				while(run){
					if(index % 2 !=0){//偶数
						if(b.type ==1 ){
							if(a.type == 3){
								a.health = a.health - (b.attack * 1.5);
							}else{
								a.health = a.health - b.attack;
							}
						}else if(b.type ==2 ){
							if(a.type == 1){
								a.health = a.health - (b.attack * 1.5);
							}else{
								a.health = a.health - b.attack;
							}
						}else{
							if(a.type == 2){
								a.health = a.health - (b.attack * 1.5);
							}else{
								a.health = a.health - b.attack;
							}
						}
						if(a.health <= 0){
							self.result = b.monstername +'获胜';
							run = false;
						}
					}else{
						if(a.type ==1 ){
							if(b.type == 3){
								b.health = b.health - (a.attack * 1.5);
							}else{
								b.health = b.health - a.attack;
							}
						}else if(a.type ==2 ){
							if(b.type == 1){
								b.health = b.health - (a.attack * 1.5);
							}else{
								b.health = b.health - a.attack;
							}
						}else{
							if(b.type == 2){
								b.health = b.health - (a.attack * 1.5);
							}else{
								b.health = b.health - a.attack;
							}
						}
						
						if(b.health <= 0){
							self.result = a.monstername +'获胜';
							run = false;
						}
					}
					index ++;
				}
				self.results.push(a);
				self.results.push(b);
			};
			
			self.finish = function() {
				$scope.bgcolor = 'white';
				$window.location.href = '/monstergame/index.jsp';
				$scope.battle = 1;
			};
		} ]);