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

CLASS op.daoaanlysis :
   {"op/dsoaanlysis.i"} 
     
    CONSTRUCTOR PUBLIC daoaanlysis () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderAnlysisData (
	  INPUT  piCompany   AS INTEGER,
	  INPUT  pcBranch    AS CHARACTER,
	  INPUT  piOrdNum    AS INTEGER,
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsoa_anlysis ):
	  
	  DEFINE VARIABLE iLoop               AS INTEGER   NO-UNDO.
	  DEFINE VARIABLE cHeaderLocationName AS CHARACTER NO-UNDO.
	  DEFINE VARIABLE cHeaderSpecialInstructions AS CHARACTER NO-UNDO.
	  
	  DEFINE BUFFER boa_gladetl  FOR oa_gladetl.
	  DEFINE BUFFER boa_anlysis  FOR oa_anlysis.

    FOR EACH boa_gladetl
       WHERE boa_gladetl.company = piCompany
         AND boa_gladetl.rectyp = "PO"
         AND boa_gladetl.glcode = "P," + pcBranch + "," + STRING(piOrdNum) NO-LOCK,
       FIRST boa_anlysis 
       WHERE boa_anlysis.company = boa_gladetl.company 
         AND boa_anlysis.anlcode = boa_gladetl.anlcode   NO-LOCK.
      CREATE ttoa_anlysis.
      BUFFER-COPY boa_anlysis TO ttoa_anlysis. 
    END.              
	  DATASET dsoa_anlysis:FILL() .
	     
	    
	END METHOD .    

	METHOD PUBLIC VOID changeOrderAnlysisData (
	  INPUT-OUTPUT DATASET FOR dsoa_anlysis):
	
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
