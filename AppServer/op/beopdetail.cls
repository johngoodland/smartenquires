
/*------------------------------------------------------------------------
    File        : beopodetail.cls
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
  
CLASS op.beopdetail :
	 {"op/schemas/dsopdetail.i"} 
      
    DEFINE PRIVATE VARIABLE daopdetail AS CLASS op.daopdetail NO-UNDO.
    
    CONSTRUCTOR PUBLIC beopdetail () :
        
        daopdetail = NEW op.daopdetail () .
                
    END CONSTRUCTOR . 
    
    DESTRUCTOR PUBLIC beopdetail () :
     
        DELETE OBJECT daopdetail NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchOrderLinesData (
        INPUT  piCompany   AS INTEGER,
        INPUT  pcBranch    AS CHARACTER,
        INPUT  piOrdNum    AS INTEGER,
        INPUT  cFilterName AS CHARACTER,
        OUTPUT DATASET FOR dsop_detail) :
     
        daopdetail:fetchOrderLinesData
            (INPUT piCompany, INPUT pcBranch, INPUT piOrdNum, INPUT cFilterName, OUTPUT DATASET dsop_detail) .
            
    END METHOD .    
    
    METHOD PUBLIC VOID changeOrderLinesData (
        INPUT-OUTPUT DATASET FOR dsop_detail):
/*                                                       */
/*        FOR EACH ttop_oheader :                        */
/*                                                       */
/*        /*    IF ttCustomer.CustomerNotes = ""         */
/*            THEN ttCustomer.CustomerNotes = "no note" .*/
/*          */                                           */
/*        END .                                          */
    
        daopdetail:changeOrderLinesData 
            (INPUT-OUTPUT DATASET dsop_detail) .
    
    END METHOD .
    
 
END CLASS .
