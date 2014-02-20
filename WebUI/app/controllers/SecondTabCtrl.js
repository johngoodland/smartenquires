'use strict'

app.controller('SecondTabCtrl', ['$scope', '$http',
  function ($scope, $http) {
    console.log('Loading SecondTabCtrl');
    $scope.title = 'Second Tab';
	$scope.selectedRows = [];
	
    $scope.myData=[{ ID:1, Name:'John',Country:'USA'},
                  {ID:2, Name:'Sachin' , Country:'India'},
                 { ID:3, Name:'Smith' , Country:'UK'} ];
  	$scope.myGrid = { 
        data: 'myData',
        showGroupPanel: true,
        columnDefs: [{field: 'ID', displayName: 'ID'},
            {field: 'Name', displayName: 'Name'},
            {field: 'Country', displayName: 'Country'}
            ]
    };	
/* 	$http.get("http://localhost:8980/smartenqService/rest/smartenqService/order").success(function(data){
		$scope.myData = data.dsop_oheader.ttop_oheader; 
	});
 */  
/*     $scope.myGrid={data:'myData',
				  selectedItems: $scope.selectedRows, // stores selected row items
				  showGroupPanel:true,
				  enablePaging:true,
				  enableColumnResize:true,
				  multiSelect:false,
				  headerRowHeight: 60 // give room for filter bar
				 };	
 */	
  }
]);