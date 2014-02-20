//This handles retrieving data and is used by controllers. 3 options (server, factory, provider) with 
//each doing the same thing just structuring the functions/data differently.
app.service('DataService', ['$http', 
		function ($http) {
		var baseURL;
		
			this.getAllRecords = function() {
				var url = "http://omexpenses.no-ip.net:8980/mobileexpenses/rest/mobileexpenses/Claims?filter=%7B%22UserID%22%3A%22demoa%22%2C%22FilterDate%22%3A%222013-11-30%22%7D";
				return $http.get(url);
			};
			
			this.getRecord = function (param) {
				//alert(JSON.stringify(param));
				return null;
			};						
			
		}]
);