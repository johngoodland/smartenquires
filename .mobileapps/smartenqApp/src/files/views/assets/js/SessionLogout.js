/* Copyright (c) 2013 Progress Software Corporation and/or its subsidiaries or affiliates.
 * All rights reserved.
 *
 * Redistributable Code.
 *
 */

/* Version: 1.3.0.2013-06-27 */
$t.SessionLogout = $t.createClass(null, {	
	
		init : function(requestOptions) {
			this.__requestOptions = $.extend({}, requestOptions);
		},
		
		process : function(settings) {
            var status = 'error';
            if (this.__requestOptions.echo)    
            	throw new Error("Echo not supported");			
        	 
            // Get pdsession object from login service.
            // But first we need to get the login service. Once Exadel adds the Session Service, 
            // we'll get the login service as a parameter. Else use default login service. 
            var svc_login = this.__requestOptions.login;
            var pdsession;
            if (svc_login)
            	pdsession = svc_login.pdsession;
            else
                pdsession = MobileService_Login.pdsession;
            
            if (pdsession != null) {
            	try 
				{
					pdsession.logout();
                	settings.success({});
                	status = 'success';
				}
				catch(err)
				{
   					var cError = "Error in LogOut: " + err.message;
                	settings.error(pdsession.lastSessionXHR, cError);
				}
            }
            // else pdsession was not set
            else {
            	var cMsg = "Error in LogOut: Can't log out. The Login service was not invoked";
                settings.error(null, cMsg);
            }
			
			settings.complete(null, status);
		} 
        
	});
