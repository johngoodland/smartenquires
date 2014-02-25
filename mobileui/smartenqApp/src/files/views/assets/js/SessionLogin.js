/* Copyright (c) 2012-2013 Progress Software Corporation and/or its subsidiaries or affiliates.
 * All rights reserved.
 *
 * Redistributable Code.
 *
 */

/* SessionLogin.js */
/* Version: 1.3.0.2013-06-25 */

$t.SessionLogin = $t.createClass(null, {
		
		init : function(requestOptions) {
            this.pdsession = null;
        	this.__requestOptions = $.extend({}, requestOptions); 
        	this.serviceSettings = this.__requestOptions.serviceSettings;
		},    
        
        process : function(settings) {
            
            if (this.__requestOptions.echo)    
            	throw new Error("Echo not supported");
            
            var cMsg = "ok";
            var bSuccess = true;
            
            try {
				showSpinner();
 
    			if (this.pdsession == null)
        			this.pdsession = new progress.data.Session();
                
                // This should be set to either "anonymous", "form" or "basic"
                this.pdsession.authenticationModel = this.serviceSettings.authenticationModel;
        
    			var loginResult = this.pdsession.login(this.serviceSettings.serviceURI,
                                      		settings.data.username, settings.data.password, this.serviceSettings.authenticationResource);
                
    			if (loginResult != progress.data.Session.LOGIN_SUCCESS) {
                    bSuccess = false;
                    
        			switch (loginResult) {
            			case progress.data.Session.LOGIN_AUTHENTICATION_FAILURE:
                			cMsg = 'Invalid userid or password';
                		break;
            			case progress.data.Session.LOGIN_GENERAL_FAILURE:
            			default:
                			cMsg = 'Service is unavailable';
                		break;
        			};        
    			} 
			} 
            catch (e) {
  				cMsg = "Failed to log in. " + e.message;
  				//console.log(e.stack);
                bSuccess = false;
			}
			finally {
                if (cMsg != "ok" && this.pdsession) {
                    var loginHttpStatus = this.pdsession.loginHttpStatus;
                    if (loginHttpStatus != undefined)
                        cMsg = 'HTTP Status  ' + loginHttpStatus.toString() + ': ' + cMsg;
                }
                    
               	hideSpinner();
            }

			// If login was successful, add catalog(s)
            if (bSuccess == true) {
                try {
                	// addCatalog() will throw an exception if it fails
                    var catalogURIs = this.serviceSettings.catalogURIs.split(',');
                    
                    for (var i = 0; i < catalogURIs.length; i++) {
						this.pdsession.addCatalog(catalogURIs[i]);
                    }
            	} 
                catch (e) {
                    cMsg = e.message;
                    bSuccess = false;
            	} 
        	}
            
            if (bSuccess == true) {
            	settings.success({}); 
            	settings.complete(null, 'success'); 
            }
            else {    
     			settings.error(this.pdsession.lastSessionXHR, cMsg);
        		settings.complete(null, 'error');
            }       
                
		} 

	});


	