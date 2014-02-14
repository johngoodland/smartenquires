/** ****************************************************************************
  Copyright 2013 Progress Software Corporation
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
    http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
**************************************************************************** **/
 /*------------------------------------------------------------------------
    File        : BusinessEntity
    Purpose     : 
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Thu Jan 10 13:58:31 EST 2013
    Notes       : 
  ----------------------------------------------------------------------*/


routine-level on error undo, throw.



using Progress.Json.ObjectModel.JsonObject.
using Progress.Json.ObjectModel.JsonConstruct.
using Progress.Json.ObjectModel.ObjectModelParser.

class BusinessEntity abstract:
    
	/*------------------------------------------------------------------------------
	 Purpose:
	 Notes:
	------------------------------------------------------------------------------*/
    DEFINE TEMP-TABLE ttADVGateway
    FIELD cAttribute AS CHARACTER
    FIELD cValue     AS CHARACTER
    INDEX Primary IS PRIMARY cAttribute.
    
    /*------------------------------------------------------------------------------
            Purpose:  Build Temp table of MobileAir parameters                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC LOGICAL ADVBuildGatewayTT( ipcADVFilter AS CHARACTER ):
      
      DEFINE VARIABLE iADVLoop      AS INTEGER      NO-UNDO.
      DEFINE VARIABLE cADVFilter    AS CHARACTER    NO-UNDO.    
  
      EMPTY TEMP-TABLE ttADVGateway NO-ERROR.
      ipcADVFilter = replace(ipcADVFilter,"ADV_",",ADV_").
      IF ipcADVFilter <> "" THEN ipcADVFilter = substring(ipcADVFilter,2,255).
      DO iADVLoop = 1 TO NUM-ENTRIES(ipcADVFilter,",").
        cADVFilter = ENTRY(iADVLoop,ipcADVFilter,",").
        MESSAGE cADVFilter.
        CREATE ttADVGateway.
        ASSIGN
          ttADVGateway.cAttribute = ENTRY(1,cADVFilter,"=")
          ttADVGateway.cVALUE = ENTRY(2,cADVFilter,"=").
      END.
           
      RETURN TRUE.
    END METHOD.
    /*------------------------------------------------------------------------------
            Purpose:  read temp table of mobileair parameters                                                                    
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER ADV_getValue( ipcAttribute AS CHARACTER ):
        
      DEFINE VARIABLE cADVResult AS CHARACTER NO-UNDO.

      cADVResult = "".
      FOR FIRST ttADVGateway 
          WHERE ttADVGateway.cAttribute = ipcAttribute NO-LOCK:
        ASSIGN
          cADVResult = ttADVGateway.cValue.
      END.
  
      RETURN cADVResult.
    END METHOD.
    /*------------------------------------------------------------------------------
            Purpose:  read temp table of mobileair parameters                                                                    
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    METHOD PUBLIC CHARACTER ADV_parseFilter( ipcADVQuery AS CHARACTER ):
        
      DEFINE VARIABLE opcADVJSONFilter AS CHARACTER NO-UNDO.
      DEFINE VARIABLE iADVPos          AS INTEGER   NO-UNDO.
 
      iADVpos = INDEX(ipcADVQuery,'}ADV_feedUser').
      IF iADVpos <> 0 THEN DO:
        ASSIGN 
         opcADVJSONFilter = SUBSTRING(ipcADVQuery,1,iADVpos).
        ADVBuildGatewayTT(SUBSTRING(ipcADVQuery,iADVPos + 1,255)).  
      END.
      ELSE DO:
        iADVpos = INDEX(ipcADVQuery,'ADV_feedUser').
        IF iADVPos <> 0 THEN DO:
          ADVBuildGatewayTT(SUBSTRING(ipcADVQuery,iADVPos,255)).
          ASSIGN 
           opcADVJSONFilter = "".
        END.
        ELSE 
          ASSIGN
            opcADVJSONFilter = ipcADVQuery.
      END.
    
    RETURN opcADVJSONFilter.
    
    END METHOD.
    /*------------------------------------------------------------------------------
            Purpose:  parse JSON                                                                    
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    method protected JsonObject ParseFilter (input pcFilter as character):
        define variable oParsedConstruct as JsonConstruct no-undo.
        define variable oParser as ObjectModelParser no-undo.
        
        oParser = new ObjectModelParser().
        oParsedConstruct = oParser:Parse(pcFilter).
       
        return cast(oParsedConstruct, JsonObject).
    end method.
    
end class.


