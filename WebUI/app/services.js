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
app.service('DataService', function () {
  var method    = 'GET';
  var url       = 'http-hello.html';
  var dataValue = [];
  
  this.getData = function () {
	this.fetch();
	return dataValue;
  };
  
  $scope.fetch = function() {
  alert('inside fetch');
    var code = null;
    var response = null;
 
    $http({method: method, url: url}).
      success(function(data, status) {
        this.status = status;
        dataValue = data;
      }).
      error(function(data, status) {
        dataValue = data || "Request failed";
        this.status = status;
    });
  };
 
/*   $scope.updateModel = function(method, url) {
    $scope.method = method;
    $scope.url = url;
  }; */

});

