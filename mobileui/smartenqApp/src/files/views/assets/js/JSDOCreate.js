/* Copyright (c) 2012-2013 Progress Software Corporation and/or its subsidiaries or affiliates.
 * All rights reserved.
 *
 * Redistributable Code.
 *
 */

/* Version: 1.0.4 */
$t.JSDOCreate = $t.createClass(null, {
    
    init : function(requestOptions) {
        this.__requestOptions = $.extend({}, requestOptions);
    },
    
    process : function(settings) {
        
        if (this.__requestOptions.echo)
            throw new Error ("Echo not supported");  
        
        var svc_jsdo = this.__requestOptions.service.jsdo;   
        var tableName = this.__requestOptions.tableName;    
        var localOnly = false;
            
        if (settings.data.localOnly != undefined) {  
            if ((typeof(settings.data.localOnly) != 'string') ||
                (settings.data.localOnly.toLowerCase() != 'false')) {
                localOnly = Boolean(settings.data.localOnly);
            }
        }
            
        if (tableName == undefined)    
            tableName = svc_jsdo._dataProperty;     
        
        /* object with initial values, if specified */
        var datarec = svc_jsdo[tableName]._recFromDataObject(settings.data);
        var jsrow = svc_jsdo[tableName].add(datarec);
          
        if (jsrow != undefined) {     
            if (localOnly) {            
                var data = svc_jsdo[tableName]._recToDataObject(jsrow.data, false);
               
                settings.success(data);
                settings.complete(null, 'success');
            }
            else {
                /* before sending the request, save it away so we execute
                   only the function for this DataSource */
                var beforeCreateFn = function (jsdo, jsrecord, request) {
                    jsdo[tableName].unsubscribe('beforeCreate', beforeCreateFn);
                    settings.request = request;
                }; 
                
                var afterCreateFn = function(jsdo, record, success, request) {
               
                    /* if not for the same request saved away on the before
                       create/update fn, just return */
                    if (request != settings.request)
                        return;
                   
                   /* unsubscribe so this fn doesn't execute for some other
                      Tiggr.DataSource event */               
                   jsdo[tableName].unsubscribe('afterCreate', afterCreateFn);
                   
                   var cStatus = 'success';
                   
                   if (success) {
                       settings.success(request.response);
                   } else {                        
                       var cError = settings.service.normalizeError(request);
                       settings.error(request.xhr, cError);      
                       cStatus = cError;
                   }
                   settings.complete(request.xhr, cStatus);
               };
                
               svc_jsdo[tableName].subscribe('beforeCreate', beforeCreateFn);
               svc_jsdo[tableName].subscribe('afterCreate', afterCreateFn);
               svc_jsdo.saveChanges();                
            }
        }
        else {     
            settings.error(null, 'Failed to add record');
            settings.complete(null, 'Failed to add record');          
        }
    } 
});          
