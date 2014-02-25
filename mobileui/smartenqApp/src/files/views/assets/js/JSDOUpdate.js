/* Copyright (c) 2012-2013 Progress Software Corporation and/or its subsidiaries or affiliates.
 * All rights reserved.
 *
 * Redistributable Code.
 *
 */

/* Version: 1.0.4 */
$t.JSDOUpdate = $t.createClass(null, {

    init: function(requestOptions) {
        this.__requestOptions = $.extend({}, requestOptions);
    },

    process: function(settings) {

        if (this.__requestOptions.echo) 
            throw new Error("Echo not supported");

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

        var datarec = svc_jsdo[tableName]._recFromDataObject(settings.data);
        var theid = datarec._id;
        
        var jsrow = svc_jsdo[tableName].findById(theid);

        if (jsrow != undefined) {
            jsrow.assign(datarec);
            
           if (localOnly) {
               settings.success(settings.data); 
               settings.complete(null, 'success');
           }
           else {                
                /* before sending the request, save it away so we execute
                   only the function for this DataSource */
                var beforeCreateUpdateFn = function (jsdo, jsrecord, request) {
                    jsdo[tableName].unsubscribe('beforeCreate', beforeCreateUpdateFn);
                    jsdo[tableName].unsubscribe('beforeUpdate', beforeCreateUpdateFn);
                    settings.request = request;
                };
                
               var afterCreateUpdateFn = function(jsdo, record, success, request) {
                   
                    /* if not for the same request saved away on the before
                       create/update fn, just return */
                    if (request != settings.request)
                        return;
                   
                   /* unsubscribe so this fn doesn't execute for some other
                      Tiggr.DataSource event */               
                   jsdo[tableName].unsubscribe('afterCreate', afterCreateUpdateFn);
                   jsdo[tableName].unsubscribe('afterUpdate', afterCreateUpdateFn);
                   
                   var cStatus = 'success';
                   
                   if (success) {
                       settings.success(request.response);
                   } else {                        
                       if (request.operation == progress.data.JSDO._OP_CREATE) {
                           /* this is the case where the record was added to the
                              local store and then updated, but since the record
                              was never sent to the server, it is really a create
                              operation (not an update), so we will put the record
                              back into the local store. Do it before calling 
                              settings.error() so new record is working record*/
                           jsdo[tableName].add(record.data);
                       }
                       var cError = settings.service.normalizeError(request);
                       settings.error(request.xhr, cError);      
                       cStatus = cError;
                   }
                   settings.complete(request.xhr, cStatus);
               };               
               svc_jsdo[tableName].subscribe('beforeCreate', beforeCreateUpdateFn);
               svc_jsdo[tableName].subscribe('beforeUpdate', beforeCreateUpdateFn);
               svc_jsdo[tableName].subscribe('afterCreate', afterCreateUpdateFn);
               svc_jsdo[tableName].subscribe('afterUpdate', afterCreateUpdateFn);
               svc_jsdo.saveChanges();
           }
        } else {
            settings.error(null, 'Row not found');
            settings.complete(null, 'Row not found');
        }
    }

});
