
/*------------------------------------------------------------------------
    File        : beopextras.cls
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
   
CLASS op.beopohistory:
	 {"op/schemas/dsopohistory.i"} 
     
    DEFINE PRIVATE VARIABLE daopohistory AS CLASS op.daopohistory NO-UNDO.
    
    CONSTRUCTOR PUBLIC beopohistory () :
        
        daopohistory = NEW op.daopohistory () .
                
    END CONSTRUCTOR . 
    
    DESTRUCTOR PUBLIC beopohistory () :
    
        DELETE OBJECT daopohistory NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchOrderHistoryData (
        INPUT  piCompany   AS INTEGER,
        INPUT  pcBranch    AS CHARACTER,
        INPUT  piOrdNum    AS INTEGER,
        INPUT  cFilterName AS CHARACTER,
        OUTPUT DATASET FOR dsop_ohistory) :
     
        daopohistory:fetchOrderHistoryData
            (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT cFilterName, OUTPUT DATASET dsop_ohistory) .
            
    END METHOD .    
    
    METHOD PUBLIC VOID changeOrderHistoryData (
        INPUT-OUTPUT DATASET FOR dsop_ohistory):
/*                                                       */
/*        FOR EACH ttop_oheader :                        */
/*                                                       */
/*        /*    IF ttCustomer.CustomerNotes = ""         */
/*            THEN ttCustomer.CustomerNotes = "no note" .*/
/*          */                                           */
/*        END .                                          */
    
        daopohistory:changeOrderHistoryData 
            (INPUT-OUTPUT DATASET dsop_ohistory) .
    
    END METHOD .
    
 
END CLASS .
