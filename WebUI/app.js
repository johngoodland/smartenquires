var app = angular.module('app', []);

app.controller('theController', ['$scope', 'DataService',
	function ($scope, DataService) {
		DataService.getAllRecords().success(function(data) {$scope.Expenses = data.eClaims});
		//DataService.getRecord().success(function(data) {$scope.Record = data.eClaims});
		
		
		var piCompany = 9996;
		var pcSupplier = "a00001" ;
		var pcBranch = "d1";
		var pcRqstby = "mk";
		var pcxChar2 = "";
		
		var jsonData = {
            "piCompany": piCompany,
            "pcSupplier": pcSupplier,
            "pcBranch": pcBranch,
            "pcRqstby": pcRqstby,
            "pcxChar2": pcxChar2
        };
		
        var update = {
            "request": jsonData
        };
		
		$scope.param = update;
		
		DataService.getRecord(update);
	}]
	
);