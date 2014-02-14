
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

CLASS op.daopoheader :

	{op/dsopoheader.i}
    
    CONSTRUCTOR PUBLIC daopoheader () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderHeaderData (
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsop_oheader ):
	
	  DEFINE QUERY qopoheader FOR op_oheader.
	  DEFINE DATA-SOURCE scopoheader FOR QUERY qopoheader .
	
	  BUFFER ttop_oheader:ATTACH-DATA-SOURCE (DATA-SOURCE scopoheader:HANDLE) .
	
/*	  QUERY qopoheader:QUERY-PREPARE 
	    ("FOR EACH op_oheader WHERE op_oheader BEGINS '" + cFilterName + "' NO-LOCK" 
	    ) . */
	  QUERY qopoheader:QUERY-PREPARE 
      ("FOR EACH op_oheader NO-LOCK by op_oheader.coy by op_oheader.branch by op_oheader.rectyp by op_oheader.ordnum descending" 
      ) .   
	  DATASET dsop_oheader:FILL() . 
	    
	END METHOD .    

	METHOD PUBLIC VOID changeOrderHeaderData (
	  INPUT-OUTPUT DATASET FOR dsop_oheader):
	
	  DEFINE DATA-SOURCE scop_oheader FOR op_oheader .
	  BUFFER ttop_oheader:ATTACH-DATA-SOURCE (DATA-SOURCE scop_oheader:HANDLE, "") .
	
	  FOR EACH ttop_oheaderBefore :
	       
	    BUFFER ttop_oheaderBefore:SAVE-ROW-CHANGES() .
	        
	  END .        
 
	END METHOD .
	
	METHOD PUBLIC VOID getOrderStatus (
	  INPUT  cCustomerID  AS CHARACTER,
	  OUTPUT cOrderStatus AS CHARACTER):
	    
		/* find order  */
	  FIND FIRST op_oheader /* WHERE op_oheader.CustomerID = cCustomerID */ 
	    NO-LOCK NO-ERROR . 
	  
	  IF NOT AVAILABLE op_oheader 
	  THEN cOrderStatus = "" .
	  ELSE cOrderStatus = op_oheader.ordsta.
	    
	END METHOD .

END CLASS .
