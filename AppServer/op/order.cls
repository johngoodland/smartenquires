 
 /*------------------------------------------------------------------------
    File        : order
    Syntax      : 
    Author(s)   : John.Goodland
    Created     : Thu Feb 13 15:28:50 GMT 2014
    Notes       : 
  ----------------------------------------------------------------------*/
    
@program FILE(name="order.cls", module="AppServer").
@openapi.openedge.export FILE(type="REST", executionMode="singleton", useReturnValue="false", writeDataSetBeforeImage="false").
@progress.service.resource FILE(name="order", URI="/order", schemaName="dsop_oheader", schemaFile="op/schemas/dsopoheader.i").

USING Progress.Json.ObjectModel.JsonObject.
USING Progress.Json.ObjectModel.JsonArray.
USING Progress.Lang.*.

ROUTINE-LEVEL ON ERROR UNDO, THROW.

CLASS op.order INHERITS BusinessEntity:

    /*------------------------------------------------------------------------------
            Purpose:                                                                      
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
	  
	{"op/schemas/ttopoheader.i"}
	{"op/schemas/dsopoheader.i"} 
	{"op/schemas/dsopsupplierheader.i"}
	{"op/schemas/dsoaanlysis.i"} 
	{"op/schemas/dsopoextras.i"}
	{"op/schemas/dsopohistory.i"}
	{"op/schemas/dsopdetail.i"}
	    
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
	   
    /*------------------------------------------------------------------------------
            Purpose:  get order header details                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
   
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/getOrderHeader?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID getOrderHeader
          (INPUT piCompany      AS INTEGER,
           INPUT pcSupplier     AS CHARACTER,
           INPUT pcBranch       AS CHARACTER,
           INPUT pcRqstby       AS CHARACTER,
           INPUT pcxChar2       AS CHARACTER,
           INPUT cFilterName    AS CHARACTER,
           INPUT filter         AS CHARACTER,
           OUTPUT DATASET dsop_supplierheader):  
     /* call RegisterMobex API */
    DEFINE VARIABLE plErrorFlag       AS LOGICAL   NO-UNDO.
    DEFINE VARIABLE pcErrorText       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cString           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cJSONString       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE pcUserID          AS CHARACTER NO-UNDO.
    
    MESSAGE "in calling getorderheader*****".
 
    IF pcBranch = ? THEN pcBranch = "".
    IF pcRqstby = ? THEN pcRqstby = "".
    IF pcxChar2 = ? THEN pcxChar2 = "".
    DEFINE VARIABLE beopsupplierheader AS CLASS op.beopsupplierheader NO-UNDO .
    beopsupplierheader = NEW op.beopsupplierheader () .

    beopsupplierheader:fetchSupplierHeaderData
      (INPUT piCompany, INPUT pcSupplier, INPUT pcBranch, INPUT pcRqstby, INPUT pcxChar2, INPUT filter, OUTPUT DATASET dsop_supplierheader) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT beopsupplierheader .
 
    END METHOD.  
            
 /*------------------------------------------------------------------------------
            Purpose:  get analysis for company, branch order number                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/getOrderAnlysis?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID getOrderAnlysis
          (INPUT piCompany      AS INTEGER,
           INPUT pcBranch       AS CHARACTER,
           INPUT piOrdNum       AS INTEGER,
           INPUT cFilterName    AS CHARACTER,
           INPUT filter         AS CHARACTER,
           OUTPUT DATASET dsoa_anlysis):  
     /* call RegisterMobex API */
    DEFINE VARIABLE plErrorFlag       AS LOGICAL   NO-UNDO.
    DEFINE VARIABLE pcErrorText       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cString           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cJSONString       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE pcUserID          AS CHARACTER NO-UNDO.
     
    MESSAGE "in calling getanlysis*****".
 
    IF pcBranch = ? THEN pcBranch = "".
    IF piOrdNum = ? THEN piOrdNum = 0.
  
    DEFINE VARIABLE beoaanlysis AS CLASS op.beoaanlysis NO-UNDO .
    beoaanlysis = NEW op.beoaanlysis () .

    beoaanlysis:fetchOrderAnlysisData
      (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT filter, OUTPUT DATASET dsoa_anlysis) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT  beoaanlysis .
 
    END METHOD.      
     /*------------------------------------------------------------------------------
            Purpose:  get analysis for company, branch order number                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
    
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/getOrderExtra?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID getOrderExtra
          (INPUT piCompany      AS INTEGER,
           INPUT pcBranch       AS CHARACTER,
           INPUT piOrdNum       AS INTEGER,
           INPUT cFilterName    AS CHARACTER,
           INPUT filter         AS CHARACTER,
           OUTPUT DATASET dsop_oextras):  
     /* call RegisterMobex API */
    DEFINE VARIABLE plErrorFlag       AS LOGICAL   NO-UNDO.
    DEFINE VARIABLE pcErrorText       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cString           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cJSONString       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE pcUserID          AS CHARACTER NO-UNDO.
     
    MESSAGE "in calling get order extra*****".
 
    IF pcBranch = ? THEN pcBranch = "".
    IF piOrdNum = ? THEN piOrdNum = 0.
  
    DEFINE VARIABLE beopextras AS CLASS op.beopoextras NO-UNDO .
    beopextras = NEW op.beopoextras () .

    beopextras:fetchOrderExtraData
      (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT filter, OUTPUT DATASET  dsop_oextras) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT  beopextras .
 
    END METHOD.      
     /*------------------------------------------------------------------------------
            Purpose:  get history for company, branch order number                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
       
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/getOrderHistory?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID getOrderHistory
          (INPUT piCompany      AS INTEGER,
           INPUT pcBranch       AS CHARACTER,
           INPUT piOrdNum       AS INTEGER,
           INPUT cFilterName    AS CHARACTER,
           INPUT filter         AS CHARACTER,
           OUTPUT DATASET dsop_ohistory):  
     /* call RegisterMobex API */
    DEFINE VARIABLE plErrorFlag       AS LOGICAL   NO-UNDO.
    DEFINE VARIABLE pcErrorText       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cString           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cJSONString       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE pcUserID          AS CHARACTER NO-UNDO.
     
    MESSAGE "in calling get order history*****".
 
    IF pcBranch = ? THEN pcBranch = "".
    IF piOrdNum = ? THEN piOrdNum = 0.
  
    DEFINE VARIABLE beophistory AS CLASS op.beopohistory NO-UNDO .
    beophistory = NEW op.beopohistory () .

    beophistory:fetchOrderHistoryData
      (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT filter, OUTPUT DATASET  dsop_ohistory) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT  beophistory.
 
    END METHOD.    
    /*------------------------------------------------------------------------------
            Purpose:  get orderlines for order                                                                     
            Notes:                                                                        
    ------------------------------------------------------------------------------*/
       
    @openapi.openedge.export(type="REST", useReturnValue="false", writeDataSetBeforeImage="false").
    @progress.service.resourceMapping(type="REST", operation="invoke", URI="/getOrderLines?filter=~{filter~}", alias="", mediaType="application/json"). 
    METHOD PUBLIC VOID getOrderLines
          (INPUT piCompany      AS INTEGER,
           INPUT pcBranch       AS CHARACTER,
           INPUT piOrdNum       AS INTEGER,
           INPUT cFilterName    AS CHARACTER,
           INPUT filter         AS CHARACTER,
           OUTPUT DATASET dsop_detail):  
     /* call RegisterMobex API */
    DEFINE VARIABLE plErrorFlag       AS LOGICAL   NO-UNDO.
    DEFINE VARIABLE pcErrorText       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cString           AS CHARACTER NO-UNDO.
    DEFINE VARIABLE cJSONString       AS CHARACTER NO-UNDO.
    DEFINE VARIABLE pcUserID          AS CHARACTER NO-UNDO.
     
    MESSAGE "in calling get order lines*****".
 
    IF pcBranch = ? THEN pcBranch = "".
    IF piOrdNum = ? THEN piOrdNum = 0.
  
    DEFINE VARIABLE beopdetail AS CLASS op.beopdetail  NO-UNDO .
    beopdetail  = NEW op.beopdetail  () .
 
    beopdetail:fetchOrderLinesData
      (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT filter, OUTPUT DATASET dsop_detail) .

    /* deleted : APPLY "close" TO hComponent . */
    DELETE OBJECT  beopdetail.
 
    END METHOD.  
END CLASS.