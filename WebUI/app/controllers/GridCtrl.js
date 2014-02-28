'use strict'

app.controller('GridCtrl', ['$scope', '$http', 'DataService', 'poProperties',
  function ($scope, $http, DataService, poProperties) {
    var dataWasLoaded = false;
	
	//console.log('Loading Grid ');
    $scope.title = 'Grid Tab';
	
	// Global Row Variables
	$scope.rowIndex = 0;
	
	
	DataService.getAllRecords().success(function(data) {$scope.myData = data.dsop_oheader.ttop_oheader});
	
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
	
	var decimalPlaces;
	
	if (decimalPlaces === undefined) {decimalPlaces = 2};
	
    var colDefs = [ {field: 'branch', displayName: 'Dept', width: 90 },
					{field: 'ordnum', displayName: 'Order', width: 90 },
					{field: 'acccod', displayName: 'Supplier', width: 90, headerCellTemplate: 'app/templates/gridFilterTemplate.html' },
					{field: 'ourref', displayName: 'Our Reference', width: "*", resizable: true, headerCellTemplate: 'app/templates/gridFilterTemplate.html' },
					{field: 'orddat', displayName: 'Order Date', width: 90, headerCellTemplate: 'app/templates/gridFilterTemplate.html',cellFilter: 'date:\'dd/MM/yyyy\'' },
					{field: 'numitm', displayName: 'Lines', width: 90 },
					//{field: 'ordval', displayName: 'Order Value', width: 110, cellFilter: 'number:2', pinnable:true },
					{field: 'ordval', displayName: 'Order Value', width: 110, pinnable:true, cellTemplate: 'app/templates/FormatCell' + decimalPlaces + 'dp.html' },
					
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
				  
				  //showColumnMenu:true,
				  
				  //filterOptions: {filterText: '', useExternalFilter: false},
				  //showFilter:true,
				  
				  plugins: [filterBarPlugin],
				  headerRowHeight: 60 // give room for filter bar

					
				  ,afterSelectionChange: function(rowItem, event) {
					if (rowItem === undefined) { /* do nothing */ }
					else{
						//var rowData = $scope.myData[rowItem.rowIndex];
						var index = $scope.myData.indexOf(rowItem.entity);
						var rowData = $scope.myData[index];
						console.log( "lol", rowItem + ' ' + index);
						//var rowData = $scope.myData[rowItem];
						poProperties.setCurrentRow(rowData);
						
						poProperties.setCompany(rowData.coy);
						poProperties.setBranch(rowData.branch);
						poProperties.setSupplier(rowData.acccod);
						poProperties.setPoOrderNo(rowData.ordnum);
						console.log("values", rowData.coy + ' ' + rowData.branch + ' ' + rowData.ordnum + ' ' + rowData.acccod);
					}
				  }
					
				 };
	
	
	
	// Force selection into the first row
	$scope.$on('ngGridEventData', function (e,s) {
		//$scope.myGrid.selectRow(0, true);
		if ($scope.myGrid.selectedItems.length > 0) { $scope.myGrid.selectRow($scope.myGrid.selectedItems[0]); }
		else {$scope.myGrid.selectRow(0, true);};
		// the following statement actually places focus into the current viewport, in this instance the actual grid
		$(".ngViewport").focus();
	});
	
  }
]);

app.controller('AddressCtrl', ['$scope',
  function ($scope) {
  
	var invoiceAddress = [{invaddr: "UK Demonstration Co."},
						  {invaddr: "The White House"},
						  {invaddr: "Church Walk"},
						  {invaddr: "Daventry"},
						  {invaddr: "Northants"}
						  ];
	var deliveryAddress = [{deladdr: "Name"},
						   {deladdr: "Delivery address line1"},
						   {deladdr: "Delivery address line2"},
						   {deladdr: "Delivery address line3"},
						   {deladdr: "Delivery address line4"}
						  ];
	var addressDetails = [{details: "001"},
						  {details: "Birmingham"},
						  {details: "fred@email.com"},
						  {details: "01234 578902456"}
						 ];
	$scope.InvoiceAddress = invoiceAddress;
	$scope.DeliveryAddress = deliveryAddress;
	$scope.AddressDetails = addressDetails;
	
	
	$scope.Email = addressDetails[2].details;
	$scope.Fax   = addressDetails[3].details;
  }
]);

app.controller('SpecialInstructionsCtrl', ['$scope', 'poProperties',
	function ($scope, poProperties) {	
		var objRow = poProperties.getCurrentRow();

		$scope.Instructions = objRow.cedtSpecialInstruc;
	}
]);

app.controller('AnalysisCtrl', ['$scope', 'DataService', 'poProperties',
	function ($scope, DataService, poProperties) {	
		
		var objRow = poProperties.getCurrentRow();
		//var piCompany = poProperties.getCompany();
		//var pcBranch  = poProperties.getBranch();
		//var piOrdNum  = poProperties.getPoOrderNo();
		
        var piCompany = objRow.coy;
		var pcBranch  = objRow.branch;
        var piOrdNum  = objRow.ordnum;
		
		var jsonData = {
            "piCompany": piCompany,
            "pcBranch": pcBranch,
            "piOrdNum": piOrdNum
        };
		
		DataService.getRecord("getOrderAnlysis", jsonData)
			.success(function(data, status, headers, config) {
				$scope.analysisData = data.response.dsoa_anlysis.dsoa_anlysis.ttoa_anlysis;
				//alert(JSON.stringify(data));
			})
			.error(function(data, status, headers, config) {
				$scope.status = status;
				alert('Error ' + status);
			});		
		/*
		$scope.analysisData = [{"company":9996,"anltyp":"Buyer","anlcode":"B1","description":"Amanda Stevens"},
							   {"company":9996,"anltyp":"Turnover","anlcode":"T1","description":"< £1m"}
							  ];
		*/
		
		var colDefs = [ {field: 'anltyp', displayName: 'Analysis Type', width: 110 },
						{field: 'anlcode', displayName: 'Analysis Code', width: 110 },
						{field: 'description', displayName: 'Description' }
						];		
		
		$scope.AnalysisGrid={data:'analysisData',
							selectedItems: $scope.selectedRows, // stores selected row items
					  //canSelectRows: true,
					  multiSelect:false,
					  columnDefs: colDefs,
					  
					  showGroupPanel:true,
					  enablePaging:true,
					  enableColumnResize:true,
					  headerRowHeight: 60 // give room for filter bar
					 };		
	
		// Force selection into the first row
		$scope.$on('ngGridEventData', function (e,s) {
			if ($scope.AnalysisGrid.selectedItems.length > 0) { $scope.AnalysisGrid.selectRow($scope.AnalysisGrid.selectedItems[0]); }
			else {$scope.AnalysisGrid.selectRow(0, true);};
		});	
	}
]);

app.controller('ExtrasCtrl', ['$scope', 'DataService', 'poProperties',
	function ($scope, DataService, poProperties) {	
		var objRow = poProperties.getCurrentRow();
		
        var piCompany = objRow.coy;
		var pcBranch  = objRow.branch;
        var piOrdNum  = objRow.ordnum;
		
		var jsonData = {
            "piCompany": piCompany,
            "pcBranch": pcBranch,
            "piOrdNum": piOrdNum
        };
		
		DataService.getRecord("getOrderExtra", jsonData)
			.success(function(data, status, headers, config) {
				$scope.extrasData = data.response.dsop_oextras.dsop_oextras.ttop_oextras;
				//alert(JSON.stringify(data));
			})
			.error(function(data, status, headers, config) {
				$scope.status = status;
				alert('Error ' + status);
			});		
		/*
		$scope.extrasData = [{"coy":9996,"branch":"D1","prdcod":"01","prdnam":"Carriage","ordext":10,"basext":10},
							   {"coy":9996,"branch":"D1","prdcod":"02","prdnam":"Postage","ordext":25,"basext":25}
							  ];
		*/
		var colDefs = [ {field: 'prdcod', displayName: 'Product Code', width: 110 },
						{field: 'prdnam', displayName: 'Description', width: 300 },
						{field: 'ordext', displayName: 'Value', cellFilter: 'number:2' }
						];		
		
		$scope.ExtrasGrid={data:'extrasData',
							selectedItems: $scope.selectedRows, // stores selected row items
					  //canSelectRows: true,
					  multiSelect:false,
					  columnDefs: colDefs,
					  
					  showGroupPanel:true,
					  enablePaging:true,
					  enableColumnResize:true,
					  headerRowHeight: 60 // give room for filter bar
					 };		
	
		// Force selection into the first row
		$scope.$on('ngGridEventData', function (e,s) {
			if ($scope.ExtrasGrid.selectedItems.length > 0) { $scope.ExtrasGrid.selectRow($scope.ExtrasGrid.selectedItems[0]); }
			else {$scope.ExtrasGrid.selectRow(0, true);};
		});	
	}
]);

app.controller('HeaderHistoryCtrl', ['$scope', 'DataService', 'poProperties',
	function ($scope, DataService, poProperties) {	
		var objRow = poProperties.getCurrentRow();
		
        var piCompany = objRow.coy;
		var pcBranch  = objRow.branch;
        var piOrdNum  = objRow.ordnum;
		
		var jsonData = {
            "piCompany": piCompany,
            "pcBranch": pcBranch,
            "piOrdNum": piOrdNum
        };
		
		DataService.getRecord("getOrderHistory", jsonData)
			.success(function(data, status, headers, config) {
				$scope.historyData = data.response.dsop_ohistory.dsop_ohistory.ttop_ohistory;
				//alert(JSON.stringify(data));
			})
			.error(function(data, status, headers, config) {
				$scope.status = status;
				alert('Error ' + status);
			});		
		
		var colDefs = [ {field: 'credat', displayName: 'Created On', width: 110, cellFilter: 'date:\'dd/MM/yyyy\'' },
						{field: 'cretim', displayName: 'Time', width: 100},
						// cellFilter: 'mediumtime:h:mm:ss a' },
						{field: 'creusr', displayName: 'Created By', width: 100 },
						{field: 'hsttyp', displayName: 'Action', width: 200 },
						{field: 'docref', displayName: 'Doc Ref' }
						];		
		
		$scope.HistoryGrid={data:'historyData',
							selectedItems: $scope.selectedRows, // stores selected row items
					  //canSelectRows: true,
					  multiSelect:false,
					  columnDefs: colDefs,
					  
					  showGroupPanel:true,
					  enablePaging:true,
					  enableColumnResize:true,
					  headerRowHeight: 60 // give room for filter bar
					 };		
	
		// Force selection into the first row
		$scope.$on('ngGridEventData', function (e,s) {
			if ($scope.HistoryGrid.selectedItems.length > 0) { $scope.HistoryGrid.selectRow($scope.HistoryGrid.selectedItems[0]); }
			else {$scope.HistoryGrid.selectRow(0, true);};
		});	
	}
]);

app.controller('POLinesCtrl', ['$scope', 'DataService', 'poProperties',
	function ($scope, DataService, poProperties) {	
		var objRow = poProperties.getCurrentRow();
		
        var piCompany = objRow.coy;
		var pcBranch  = objRow.branch;
        var piOrdNum  = objRow.ordnum;
		
		var jsonData = {
            "piCompany": piCompany,
            "pcBranch": pcBranch,
            "piOrdNum": piOrdNum
        };
		
		DataService.getRecord("getOrderLines", jsonData)
			.success(function(data, status, headers, config) {
				$scope.linesData = data.response.dsop_detail.dsop_detail.ttop_detail;
				//alert(JSON.stringify(data));
			})
			.error(function(data, status, headers, config) {
				$scope.status = status;
				alert('Error ' + status);
			});		
		
		var colDefs = [ {field: 'coy', displayName: 'Company', visible:false },
						{field: 'linnum', displayName: 'Line', width: 100 },
						{field: 'prdcod', displayName: 'Product', width: 100, groupable: true },
						{field: 'prdnam', displayName: 'Description', width: 200, groupable: true },
						{field: 'ordqty', displayName: 'Ord Qty' },
						{field: 'outqty', displayName: 'O/S Qty' },
						{field: 'prduom', displayName: 'Units' },
						{field: 'ordpri', displayName: 'Nett Price' },
						{field: 'ordsta', displayName: 'Status' }
						];		
		
		$scope.LinesGrid={data:'linesData',
							selectedItems: $scope.selectedRows, // stores selected row items
							
							//canSelectRows: true,
							multiSelect:false,
							columnDefs: colDefs,
					  showGroupPanel: true,
					  
					  enablePaging:true,
					  //enableColumnResize:true,
					  //headerRowHeight: 60 // give room for filter bar
					 };		
	
		// Force selection into the first row
		$scope.$on('ngGridEventData', function (e,s) {
			if ($scope.LinesGrid.selectedItems.length > 0) { $scope.LinesGrid.selectRow($scope.LinesGrid.selectedItems[0]); }
			else {$scope.LinesGrid.selectRow(0, true);};
		});	
	}
]);

