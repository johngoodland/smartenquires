
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
  
CLASS op.beopoheader :
  {op/ttopoheader.i}
	{op/dsopoheader.i}
    
    DEFINE PRIVATE VARIABLE daopoheader AS CLASS op.daopoheader NO-UNDO.
    
    CONSTRUCTOR PUBLIC beopoheader () :
        
        daopoheader = NEW op.daopoheader () .
                
    END CONSTRUCTOR . 
    
    DESTRUCTOR PUBLIC beopoheader () :
    
        DELETE OBJECT daopoheader NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchOrderHeaderData (
        INPUT  cFilterName AS CHARACTER,
        OUTPUT DATASET FOR dsop_oheader) :
    
        daopoheader:fetchOrderHeaderData
            (INPUT cFilterName, OUTPUT DATASET dsop_oheader) .
            
    END METHOD .    
    
    METHOD PUBLIC VOID changeOrderHeaderData (
        INPUT-OUTPUT DATASET FOR dsop_oheader):
    
        FOR EACH ttop_oheader :
        
        /*    IF ttCustomer.CustomerNotes = "" 
            THEN ttCustomer.CustomerNotes = "no note" . 
          */
        END .
    
        daopoheader:changeOrderHeaderData
            (INPUT-OUTPUT DATASET dsop_oheader) .
    
    END METHOD .
    
    METHOD PUBLIC VOID checkOrderStatus (
        INPUT  cCustomerID AS CHARACTER,  
        OUTPUT lPremium    AS LOGICAL):
        
        DEFINE VARIABLE cOrderStatus AS CHARACTER     NO-UNDO.
        
    	daopoheader:getOrderStatus
    	    (INPUT cCustomerID, OUTPUT cOrderStatus) .
    	
    	/* check orderstatus */
          
        
    END METHOD .
    

END CLASS .
