/*
app.service('DataService', function ($scope, $http, $templateCache) {
//function FetchCtrl($scope, $http, $templateCache) {
  $scope.method = 'GET';
  $scope.url = 'http-hello.html';
 
  $scope.fetch = function() {
    $scope.code = null;
    $scope.response = null;
 
    $http({method: $scope.method, url: $scope.url, cache: $templateCache}).
      success(function(data, status) {
        $scope.status = status;
        $scope.data = data;
      }).
      error(function(data, status) {
        $scope.data = data || "Request failed";
        $scope.status = status;
    });
  };
 
  $scope.updateModel = function(method, url) {
    $scope.method = method;
    $scope.url = url;
  };
});
*/

app.service('DataService', ['$http', 
		function ($http) {
		var baseURL = "http://localhost:8980/smartenqService/rest/smartenqService/order";
		//var baseURL = "http://10.9.32.93:8980/smartenqService/rest/smartenqService/order";
		
			this.getAllRecords = function() {
				var url = baseURL;
				return $http.get(url);
			};
			
			this.getRecord = function (urlParam, filterJSONParam) {
				// The filterJSONParam MUST be JSONified in the calling method
				var dataRequest = {
									"request": filterJSONParam
								  };
				var dataURL = baseURL + "/" + urlParam;
				//alert('getRecord for ' + dataURL + JSON.stringify(dataRequest));
				/*
				$http({
						url: dataURL,
						method: "PUT",
						data: JSON.stringify(dataRequest)
					 }).success(function(data, status, headers, config) {
							$scope.data = data;
							alert(JSON.stringify(data));
					 }).error(function(data, status, headers, config) {
							$scope.status = status;
							alert('Error ' + status);
							});				
				
				return null;
				*/
				return $http({
						url: dataURL,
						method: "PUT",
						data: JSON.stringify(dataRequest)
					 });
			};						
			
			this.getAjaxRecord = function (urlParam, filterJSONParam) {
				var dataRequest = {
									"request": filterJSONParam
								  };
				var dataURL = baseURL + "/" + urlParam;				
				
				jQuery.ajax({
							type: "PUT",
							dataType: "json",
							data: JSON.stringify(dataRequest),
							contentType: "application/json; charset=utf-8",
							url: dataURL,
							success: function(msg){
								alert(JSON.stringify(msg));
							},
							error: function(jqXHR, exception){
								alert("Actual error "+ jqXHR.status);
							}
				});		
			};
			
		}]
);

app.service('poProperties', function () {
	var propCompany = 0;
	var propBranch = "";
	var propSupplier = "";
	var propPoOrderNum = 0;
	var objCurrentRow;
	
    return {
        getCompany: function() {
            return propCompany;
        },		
        setCompany: function(value) {
            propCompany = value;
        },
        getBranch: function() {
            return propBranch;
        },		
        setBranch: function(value) {
            propBranch = value;
        },
        getSupplier: function() {
            return propSupplier;
        },		
        setSupplier: function(value) {
            propSupplier = value;
        },
        getPoOrderNo: function() {
            return propPoOrderNum;
        },		
        setPoOrderNo: function(value) {
            propPoOrderNum = value;
        },
		
        getCurrentRow: function() {
            return objCurrentRow;
        },		
        setCurrentRow: function(value) {
            objCurrentRow = value;
        }
		
		
		
		
    }	
	
});
