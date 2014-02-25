
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
  
CLASS op.beopoextras :
	 {"op/schemas/dsopoextras.i"} 
     
    DEFINE PRIVATE VARIABLE daopoextras AS CLASS op.daopoextras NO-UNDO.
    
    CONSTRUCTOR PUBLIC beopoextras () :
        
        daopoextras = NEW op.daopoextras () .
                
    END CONSTRUCTOR . 
    
    DESTRUCTOR PUBLIC beopoextras () :
    
        DELETE OBJECT daopoextras NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchOrderExtraData (
        INPUT  piCompany   AS INTEGER,
        INPUT  pcBranch    AS CHARACTER,
        INPUT  piOrdNum    AS INTEGER,
        INPUT  cFilterName AS CHARACTER,
        OUTPUT DATASET FOR dsop_oextras) :
     
        daopoextras:fetchOrderExtraData
            (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT cFilterName, OUTPUT DATASET dsop_oextras) .
            
    END METHOD .    
    
    METHOD PUBLIC VOID changeOrderExtraData (
        INPUT-OUTPUT DATASET FOR dsop_oextras):
/*                                                       */
/*        FOR EACH ttop_oheader :                        */
/*                                                       */
/*        /*    IF ttCustomer.CustomerNotes = ""         */
/*            THEN ttCustomer.CustomerNotes = "no note" .*/
/*          */                                           */
/*        END .                                          */
    
        daopoextras:changeOrderExtraData 
            (INPUT-OUTPUT DATASET dsop_oextras) .
    
    END METHOD .
    
 
END CLASS .
