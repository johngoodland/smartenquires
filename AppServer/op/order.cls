 
 /*------------------------------------------------------------------------
    File        : order
    Syntax      : 
    Author(s)   : John.Goodland
    Created     : Thu Feb 13 15:28:50 GMT 2014
    Notes       : 
  ----------------------------------------------------------------------*/
    
@program FILE(name="order.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="order", URI="/order", schemaName="dsop_oheader", schemaFile="op/dsopoheader.i").

USING Progress.Json.ObjectModel.JsonObject.
USING Progress.Json.ObjectModel.JsonArray.
USING Progress.Lang.*.

ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS op.order INHERITS BusinessEntity:

    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
	
	
	{"op/dsopoheader.i"} 
	
	
    /*------------------------------------------------------------------------------
            Purpose:  Get one or more records, based on a filter string                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="read", URI="?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID Readorder(
    		INPUT filter AS CHARACTER, 
    		OUTPUT DATASET dsop_oheader):
    
    DEFINE VARIABLE pcWhere AS CHARACTER.
    
    DEFINE VARIABLE beopoheader AS CLASS op.beopoheader NO-UNDO .
    beopoheader = NEW op.beopoheader () .

    beopoheader:fetchOrderHeaderData
      (INPUT filter, OUTPUT DATASET dsop_oheader) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT beopoheader .
     
	         
        /* TODO: Add code to get a set of records and return the
           resulting records to the client. */      
    END METHOD.
	  
    /*------------------------------------------------------------------------------
            Purpose: Create one or more new records                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/  
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="create", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID Createorder(INPUT-OUTPUT DATASET dsop_oheader):    		
	            
        /* TODO: Add code to create a record from data passed
           in from the client. */        
    END METHOD.    
	
    /*------------------------------------------------------------------------------
            Purpose:  Update one or more records                                                                  
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="update", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID Updateorder(INPUT-OUTPUT DATASET dsop_oheader):    		
	          
        /* TODO: Add code to update a record from data passed
           in from the client. */          
    END METHOD.
	
    /*------------------------------------------------------------------------------
            Purpose:    Delete a record                                                               
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="delete", URI="", alias="", mediaType="application/json").
    METHOD PUBLIC VOID Deleteorder(INPUT-OUTPUT DATASET dsop_oheader):     		       
	   
        /* TODO: Add code to delete a record passed in from the client. */   
    END METHOD.
	 
          
END CLASS.