
/*------------------------------------------------------------------------
    File        : customer.p
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : AppTech
    Created     : Fri Jan 26 09:39:53 GMT 2007
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
  
CLASS op.daopsupplierheader :
  {op/ttopoheader.i}
  {op/dsopsupplierheader.i}
    CONSTRUCTOR PUBLIC daopsupplierheader () :
         
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchSupplierHeaderData (     
    INPUT piCompany      AS INTEGER, 
    INPUT pcSupplier     AS CHARACTER,
    INPUT pcBranch       AS CHARACTER,
    INPUT pcRqstby       AS CHARACTER,
    INPUT pcxchar2       AS CHARACTER, 
    INPUT cFilterName    AS CHARACTER,
    OUTPUT DATASET FOR dsop_supplierheader):
   /*   
    DEFINE BUFFER ttop_brnfil1 FOR ttop_brnfil.
    DEFINE BUFFER ttoa_supplier1 FOR oa_supplier.
    
    DEFINE QUERY qoSupplier  FOR oa_supplier.
    DEFINE QUERY qobrnFil    FOR op_brnfil, ttoa_supplier.
    DEFINE QUERY qoRequester FOR op_requester, ttop_brnfil.
    DEFINE QUERY qoCucode    FOR oa_cucode, ttop_brnfil1.
    DEFINE QUERY qoCountry   FOR oa_country.
 .
    DEFINE DATA-SOURCE scSupplier    FOR QUERY qoSupplier.
    DEFINE DATA-SOURCE scopbrnFil    FOR QUERY qobrnFil.
    DEFINE DATA-SOURCE scopRequester FOR QUERY qoRequester.
    DEFINE DATA-SOURCE scoaCuCode    FOR QUERY qoCucode. 
    DEFINE DATA-SOURCE scoaCountry   FOR QUERY qoCountry.
  
    BUFFER ttoa_supplier:ATTACH-DATA-SOURCE (DATA-SOURCE scSupplier:HANDLE) .
    BUFFER ttop_brnfil:ATTACH-DATA-SOURCE (DATA-SOURCE scopbrnFil:HANDLE) .
    BUFFER ttop_requester:ATTACH-DATA-SOURCE (DATA-SOURCE scopRequester:HANDLE) .
    BUFFER ttoa_cucode:ATTACH-DATA-SOURCE (DATA-SOURCE scoaCuCode:HANDLE) . 
    BUFFER ttoa_country:ATTACH-DATA-SOURCE (DATA-SOURCE scoaCountry:HANDLE) .
    
    assign
      pcxchar2 = "aa".
      pcRqstby = "john".
 /* "FOR EACH op_oheader NO-LOCK WHERE op_oheader.coy = " + STRING(piCoy) + " AND op_oheader.branch = '" + pcBranch + "' AND op_oheader.rectyp = '" + pcRecType + "' AND op_oheader.ordnum = " + STRING(piOrdnum) + ", " */ 
    /* worry about filtername? yes but what will be in it other than the below? */
    QUERY qoSupplier:QUERY-PREPARE 
      ("FOR EACH oa_supplier NO-LOCK WHERE oa_supplier.company =  " + STRING(piCompany) + " AND oa_supplier.supplier = '" + pcSupplier + "'").
    QUERY qobrnFil:QUERY-PREPARE   
      ("FOR EACH op_brnfil NO-LOCK, EACH ttoa_supplier WHERE op_brnfil.coy = ttoa_supplier.company AND op_brnfil.rectyp = 'b' AND op_brnfil.brncod = '" +  pcBranch + "'").
    QUERY qoRequester:QUERY-PREPARE  
     ("FOR EACH op_requester NO-LOCK, EACH ttop_brnfil WHERE op_requester.company = ttop_brnfil.coy AND op_requester.reqcode = '" + pcRqstby + "'").     
      /*  ("FOR EACH op_requester NO-LOCK, EACH ttop_brnfil WHERE op_requester.company = ttop_brnfil.coy AND op_requester.reqcode = '" + pcRqstby + "' AND op_requester.branch = ttop_brnfil.brncod").  */
   QUERY qoCucode:QUERY-PREPARE 
     /*("for each oa_cucode no-lock"). */
     ("FOR EACH oa_cucode NO-LOCK, EACH op_brnfil1 WHERE oa_cucode.company = op_brnfil1.coy AND oa_cucode.currency = op_brnfil1.corcur"). 
    QUERY qoCountry:QUERY-PREPARE   
      ("FOR EACH oa_country NO-LOCK WHERE oa_country.ccode = '" + pcxchar2 + "' and oa_country.rtype = 'c'").  
 */
                                                                                                                             
    FOR EACH oa_supplier NO-LOCK WHERE oa_supplier.company = piCompany   AND oa_supplier.supplier =   pcSupplier:
      CREATE ttoa_supplier.
      BUFFER-COPY oa_supplier TO ttoa_supplier.
    END.
    FOR EACH op_brnfil NO-LOCK WHERE op_brnfil.coy =  piCompany  AND op_brnfil.rectyp = 'b' AND op_brnfil.brncod =   pcBranch:
      CREATE ttop_brnfil.
      BUFFER-COPY op_brnfil TO ttop_brnfil.
      FOR EACH op_requester NO-LOCK WHERE op_requester.company = piCompany AND op_requester.reqcode =  pcRqstby AND op_requester.branch = op_brnfil.brncod:
        CREATE ttop_requester.
        BUFFER-COPY op_requester TO ttop_requester.
      END. 
      FOR EACH oa_cucode NO-LOCK WHERE oa_cucode.company = piCompany AND oa_cucode.currency = op_brnfil.corcur:
        CREATE ttoa_cucode.
        BUFFER-COPY oa_cucode TO ttoa_cucode.  
      END.         
    END.
    FOR EACH oa_country  WHERE oa_country.ccode = pcxchar2 and oa_country.rtype = 'c':  
      CREATE ttoa_country.
      BUFFER-COPY oa_country TO ttoa_country.    
    END. 
                                                                                 
                                    
   /*   DATASET dsop_supplierheader:FILL-MODE = "REPLACE".             */                                                                                                                       
    DATASET dsop_supplierheader:FILL() . 
	   
	END METHOD .    
 
	METHOD PUBLIC VOID changeSupplierHeaderData (
	  INPUT-OUTPUT DATASET FOR dsop_supplierheader):
	/*
	  DEFINE DATA-SOURCE scop_oheader FOR op_oheader .
	  BUFFER ttop_oheader:ATTACH-DATA-SOURCE (DATA-SOURCE scop_oheader:HANDLE, "") .
	
	  FOR EACH ttop_oheaderBefore :
	       
	    BUFFER ttop_oheaderBefore:SAVE-ROW-CHANGES() .
	        
	  END .        
 */
	END METHOD .
	

END CLASS .
