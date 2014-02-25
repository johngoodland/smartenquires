/*------------------------------------------------------------------------
    File        : daoaanlysis.cls
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : johng
    Created     : Feb 2014
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

CLASS op.daopoextras :
   {"op/schemas/dsopoextras.i"} 
     
    CONSTRUCTOR PUBLIC daopoextras () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderExtraData (
	  INPUT  piCompany   AS INTEGER,
	  INPUT  pcBranch    AS CHARACTER,
	  INPUT  piOrdNum    AS INTEGER,
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsop_oextras):
	  
    DEFINE QUERY qoopoextras FOR op_oextras.
 
    DEFINE DATA-SOURCE scopoheader   FOR QUERY  qoopoextras  .
 
    BUFFER ttop_oextras:ATTACH-DATA-SOURCE (DATA-SOURCE scopoheader:HANDLE) .
 
    QUERY qoopoextras:QUERY-PREPARE 
      ("FOR EACH op_oextras WHERE op_oextras.coy = " + STRING(piCompany) + " AND op_oextras.branch = '" + pcBranch 
        + "' AND op_oextras.ordnum = " + STRING(piOrdNum) + " AND op_oextras.rectyp = 'p' NO-LOCK" 
      ) .  
   
  
/*    FOR EACH boa_gladetl                                                           */
/*       WHERE boa_gladetl.company = piCompany                                       */
/*         AND boa_gladetl.rectyp = "PO"                                             */
/*         AND boa_gladetl.glcode = "P," + pcBranch + "," + STRING(piOrdNum) NO-LOCK,*/
/*       FIRST boa_anlysis                                                           */
/*       WHERE boa_anlysis.company = boa_gladetl.company                             */
/*         AND boa_anlysis.anlcode = boa_gladetl.anlcode   NO-LOCK.                  */
/*      CREATE ttop_oextras.                                                         */
/*      BUFFER-COPY boa_anlysis TO ttoa_anlysis.                                     */
/*    END.                                                                           */
	  DATASET dsop_oextras:FILL() .
	     
	    
	END METHOD .    

	METHOD PUBLIC VOID changeOrderExtraData  (
	  INPUT-OUTPUT DATASET FOR dsop_oextras):
	
/*	  DEFINE DATA-SOURCE scop_oheader FOR op_oheader .                              */
/*	  BUFFER ttop_oheader:ATTACH-DATA-SOURCE (DATA-SOURCE scop_oheader:HANDLE, "") .*/
/*	                                                                                 */
/*	  FOR EACH ttop_oheaderBefore :                                                 */
/*	                                                                                 */
/*	    BUFFER ttop_oheaderBefore:SAVE-ROW-CHANGES() .                              */
/*	                                                                                 */
/*	  END .                                                                         */
 
	END METHOD .
	
 

END CLASS .
