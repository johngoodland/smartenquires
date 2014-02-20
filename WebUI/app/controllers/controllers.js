/*#######################################################################
  
  Martyn Kemp
  
  #######################################################################*/

app.controller('gridCTRL', function($scope, $http) {
	$http.get("http://localhost:8980/smartenqService/rest/smartenqService/order").success(function(data){
		$scope.myData = data.dsop_oheader.ttop_oheader; 
	});
	
   //now add the above object to your ngGrid
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
				  columnDefs: colDefs,
				  
				  showGroupPanel:true,
				  enablePaging:true,
				  enableColumnResize:true,
				  multiSelect:false,
				  //showColumnMernu:true,
				  
				  //filterOptions: {filterText: '', useExternalFilter: false},
				  //showFilter:true,
				  
				  plugins: [filterBarPlugin],
				  headerRowHeight: 60 // give room for filter bar
				 };

});

app.controller('poCTRL', function ($scope) {


});

app.controller('NavbarController', function ($scope, $location) {
    $scope.getClass = function (path) {
        if ($location.path().substr(0, path.length) == path) {
            return true
        } else {
            return false;
        }
    }
});
