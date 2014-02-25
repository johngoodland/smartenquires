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

CLASS op.daopohistory :
   {"op/schemas/dsopohistory.i"} 
     
    CONSTRUCTOR PUBLIC daopohistory () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderHistoryData (
	  INPUT  piCompany   AS INTEGER,
	  INPUT  pcBranch    AS CHARACTER,
	  INPUT  piOrdNum    AS INTEGER,
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsop_ohistory):
	  
    DEFINE QUERY qoopohistory FOR op_ohistory.
 
    DEFINE DATA-SOURCE scopohistory   FOR QUERY  qoopohistory .
 
    BUFFER ttop_ohistory:ATTACH-DATA-SOURCE (DATA-SOURCE scopohistory:HANDLE) .
 
    QUERY qoopohistory:QUERY-PREPARE 
      ("FOR EACH op_ohistory WHERE op_ohistory.coy = " + STRING(piCompany) + " AND op_ohistory.branch = '" + pcBranch 
        + "' AND op_ohistory.ordnum = " + STRING(piOrdNum) + " AND op_ohistory.rectyp = 'p' NO-LOCK" 
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
	  DATASET dsop_ohistory:FILL() .
	     
	    
	END METHOD .    

	METHOD PUBLIC VOID changeOrderHistoryData  (
	  INPUT-OUTPUT DATASET FOR dsop_ohistory):
	
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
