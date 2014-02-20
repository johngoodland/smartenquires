'use strict'

app.controller('GridCtrl', ['$scope', '$http', 
  function ($scope, $http) {
    var dataWasLoaded = false;
	
	console.log('Loading Grid ');
    $scope.title = 'Grid Tab';
		
	$http.get("http://localhost:8980/smartenqService/rest/smartenqService/order").success(function(data){
		$scope.myData = data.dsop_oheader.ttop_oheader; 
	});
	
	$scope.selectedRows = [];

    var filterBarPlugin = {
        init: function(scope, grid) {
            filterBarPlugin.scope = scope;
            filterBarPlugin.grid = grid;
            $scope.$watch(function() {
                var searchQuery = "";
                angular.forEach(filterBarPlugin.scope.columns, function(col) {
                    if (col.visible && col.filterText) {
                        var filterText = (col.filterText.indexOf('*') == 0 ? col.filterText.replace('*', '') : "^" + col.filterText) + ";";
                        searchQuery += col.displayName + ": " + filterText;
                    }
                });
                return searchQuery;
            }, function(searchQuery) {
                filterBarPlugin.scope.$parent.filterText = searchQuery;
                filterBarPlugin.grid.searchProvider.evalFilter();
            });
        },
        scope: undefined,
        grid: undefined,
    };
	
    var colDefs = [ {field: 'branch', displayName: 'Dept', width: 90 },
					{field: 'ordnum', displayName: 'Order', width: 90 },
					{field: 'acccod', displayName: 'Supplier', width: 90, headerCellTemplate: 'app/templates/gridFilterTemplate.html' },
					{field: 'ourref', displayName: 'Our Reference', width: "*", resizable: true, headerCellTemplate: 'app/templates/gridFilterTemplate.html' },
					{field: 'orddat', displayName: 'Order Date', width: 90, headerCellTemplate: 'app/templates/gridFilterTemplate.html',cellFilter: 'date:\'dd/MM/yyyy\'' },
					{field: 'numitm', displayName: 'Lines', width: 90 },
					{field: 'ordval', displayName: 'Order Value', width: 90, cellFilter: 'currency', pinnable:true },
					{field: 'ordsta', displayName: 'Stat', width: 90 },
					{field: 'pornum', displayName: 'GRN', width: 90, visible:false }
					];
	//var	filterText = '<Order Date>:<literal 1>|';
    $scope.myGrid={data:'myData',
				  selectedItems: $scope.selectedRows, // stores selected row items
				  //canSelectRows: true,
				  multiSelect:false,
				  columnDefs: colDefs,
				  
				  showGroupPanel:true,
				  enablePaging:true,
				  enableColumnResize:true,
				  
				  //showColumnMernu:true,
				  
				  //filterOptions: {filterText: '', useExternalFilter: false},
				  //showFilter:true,
				  
				  plugins: [filterBarPlugin],
				  headerRowHeight: 60 // give room for filter bar
				 };
	
	
	// Force selection into the first row
	$scope.$on('ngGridEventData', function (e,s) {
		//$scope.myGrid.selectRow(0, true);
		if ($scope.myGrid.selectedItems.length > 0) { $scope.myGrid.selectRow($scope.myGrid.selectedItems[0]); }
		else {$scope.myGrid.selectRow(0, true);};
	});
	
  }
]);