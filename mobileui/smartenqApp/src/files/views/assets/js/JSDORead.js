/* Copyright (c) 2012-2013 Progress Software Corporation and/or its subsidiaries or affiliates.
 * All rights reserved.
 *
 * Redistributable Code.
 *
 */

/* Version: 1.0.4 */
$t.JSDORead = $t.createClass(null, {

    init: function(requestOptions) {
        this.__requestOptions = $.extend({}, requestOptions);
    },

    process: function(settings) {
        if (this.__requestOptions.echo)    
            throw new Error("Echo not supported");

        var filter = '';
        var isLocal = false;

        if (settings.data.filter != undefined) 
            filter = settings.data.filter;
        if (settings.data.readLocal != undefined) {  
            if ((typeof(settings.data.readLocal) != 'string') ||
                (settings.data.readLocal.toLowerCase() != 'false')) {
                isLocal = Boolean(settings.data.readLocal);
            }
        }

        var svc_jsdo = this.__requestOptions.service.jsdo;
        if (!isLocal) {
            
            /* before sending the request, save it away so we executed
               only the function for this DataSource */
            var beforeFillFn = function (jsdo, request) {
                jsdo.unsubscribe('beforeFill', beforeFillFn);
                settings.request = request;
            };
                
            var afterFillFn = function(jsdo, success, request) {                
                
                /* if not for the same request saved away on the before
                   fill fn, just return */
                if (request != settings.request)
                    return;
                
                /* unsubscribe so this fn doesn't execute for some other
                   Tiggr.DataSource event */                
                jsdo.unsubscribe('afterFill', afterFillFn);
                
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
            svc_jsdo.subscribe('beforeFill', beforeFillFn);
            svc_jsdo.subscribe('afterFill', afterFillFn);
            svc_jsdo.fill(filter);
        } else {
            var data = svc_jsdo._getDataObject();

            settings.success(data);
            settings.complete(null, 'success');
        }
    }

});
