/*
 * Service settings
 */
var MobileService_Settings = {
    "authenticationModel": "anonymous",
    "authenticationResource": "/static/home.html",
    "catalogURIs": "",
    "serviceURI": ""
}

/*
 * Services
 */
MobileService_Login = new Appery.SessionLogin({

    'serviceSettings': MobileService_Settings
});
MobileService_Logout = new Appery.SessionLogout({

    'serviceSettings': MobileService_Settings
});