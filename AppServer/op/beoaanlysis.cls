
/*------------------------------------------------------------------------
    File        : beoaanlysis.cls
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
  
CLASS op.beoaanlysis :
	 {"op/dsoaanlysis.i"} 
    
    DEFINE PRIVATE VARIABLE daoaanlysis AS CLASS op.daoaanlysis NO-UNDO.
    
    CONSTRUCTOR PUBLIC beoaanlysis () :
        
        daoaanlysis = NEW op.daoaanlysis () .
                
    END CONSTRUCTOR . 
    
    DESTRUCTOR PUBLIC beoaanlysis () :
    
        DELETE OBJECT daoaanlysis NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchOrderAnlysisData (
        INPUT  piCompany   AS INTEGER,
        INPUT  pcBranch    AS CHARACTER,
        INPUT  piOrdNum    AS INTEGER,
        INPUT  cFilterName AS CHARACTER,
        OUTPUT DATASET FOR dsoa_anlysis) :
     
        daoaanlysis:fetchOrderAnlysisData
            (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT cFilterName, OUTPUT DATASET dsoa_anlysis) .
            
    END METHOD .    
    
    METHOD PUBLIC VOID changeOrderAnlysisData (
        INPUT-OUTPUT DATASET FOR dsoa_anlysis):
/*                                                       */
/*        FOR EACH ttop_oheader :                        */
/*                                                       */
/*        /*    IF ttCustomer.CustomerNotes = ""         */
/*            THEN ttCustomer.CustomerNotes = "no note" .*/
/*          */                                           */
/*        END .                                          */
    
        daoaanlysis:changeOrderAnlysisData 
            (INPUT-OUTPUT DATASET dsoa_anlysis) .
    
    END METHOD .
    
 
END CLASS .
