/*#######################################################################
  
  Martyn Kemp
  
  #######################################################################*/

'use strict'

var app = angular.module('EnquiryApp', ['bootstrap.tabset','focus.element', 'ngGrid','ngRoute']);
// var app = angular.module('EnquiryApp', ['bootstrap.tabset','ngGrid','ngRoute','ngResource']);

// Trying to create and use a Services Factory for data retrieval
//var app = angular.module('EnquiryApp', ['bootstrap.tabset','ngGrid','ngRoute','DataServices']);

//This configures the routes and associates each route with a view and a controller
app.config(function ($routeProvider) {
// app.config(function ($routeProvider, $locationProvider) {
    //$locationProvider.html5Mode(true);
	$routeProvider
/*         .when('/tabbed',
            {
                templateUrl: 'app/templates/tabbed.html'
            }) */

		.when('/',
            {
                templateUrl: 'app/templates/tabbed.html'
            })
        .otherwise({ redirectTo: '/' });
	
	
});