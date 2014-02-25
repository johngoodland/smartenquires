/*------------------------------------------------------------------------
    File        : daopodetail.cls
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

CLASS op.daopdetail :
   {"op/schemas/dsopdetail.i"} 
     
    CONSTRUCTOR PUBLIC daopdetail () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderLinesData (
	  INPUT  piCompany   AS INTEGER,
	  INPUT  pcBranch    AS CHARACTER,
	  INPUT  piOrdNum    AS INTEGER,
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsop_detail):
	  
    DEFINE QUERY qoopdetail FOR op_detail.
  
    DEFINE DATA-SOURCE scopdetail   FOR QUERY  qoopdetail  .
 
    BUFFER ttop_detail:ATTACH-DATA-SOURCE (DATA-SOURCE scopdetail:HANDLE) .
 
    QUERY qoopdetail:QUERY-PREPARE 
      ("FOR EACH op_detail WHERE op_detail.coy = " + STRING(piCompany) + " AND op_detail.branch = '" + pcBranch 
        + "' AND op_detail.ordnum = " + STRING(piOrdNum) + " AND op_detail.rectyp = 'p' NO-LOCK" 
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
	  DATASET dsop_detail:FILL() .
	     
	    
	END METHOD .    

	METHOD PUBLIC VOID changeOrderLinesData  (
	  INPUT-OUTPUT DATASET FOR dsop_detail):
	
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
