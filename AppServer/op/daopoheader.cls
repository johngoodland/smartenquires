/*------------------------------------------------------------------------
    File        : daopoheader.cls
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

CLASS op.daopoheader :
  {op/ttopoheader.i}
	{op/dsopoheader.i}
     
    CONSTRUCTOR PUBLIC daopoheader () :
        
            
    END CONSTRUCTOR .
    
	METHOD PUBLIC VOID fetchOrderHeaderData (
	  INPUT  cFilterName AS CHARACTER,
	  OUTPUT DATASET FOR dsop_oheader ):
	  
	  DEFINE VARIABLE iLoop               AS INTEGER   NO-UNDO.
	  DEFINE VARIABLE cHeaderLocationName AS CHARACTER NO-UNDO.
	  DEFINE VARIABLE cHeaderSpecialInstructions AS CHARACTER NO-UNDO.
	  
	  DEFINE BUFFER bop_oHeader  FOR op_oheader.
	  DEFINE BUFFER boa_location FOR oa_location.
	  DEFINE BUFFER bop_textfile FOR op_textfile. 
 /*
	  DEFINE QUERY qopoheader FOR op_oheader.
    DEFINE QUERY qoopTextfile FOR op_textfile, ttop_oheader.
   
	  DEFINE DATA-SOURCE scopoheader   FOR QUERY qopoheader .
 
	  DEFINE DATA-SOURCE scopoTextFile FOR QUERY qoopTextfile .
	   
	  BUFFER ttop_oheader:ATTACH-DATA-SOURCE (DATA-SOURCE scopoheader:HANDLE) .
	  BUFFER ttop_TextFile:ATTACH-DATA-SOURCE (DATA-SOURCE scopoTextFile:HANDLE) .
	   /*
 	  QUERY qopoheader:QUERY-PREPARE 
	    ("FOR EACH op_oheader WHERE op_oheader BEGINS '" + cFilterName + "' NO-LOCK" 
	    ) . */
	  QUERY qopoheader:QUERY-PREPARE 
      ("FOR EACH op_oheader WHERE op_oheader.coy = 404 NO-LOCK by op_oheader.coy by op_oheader.branch by op_oheader.rectyp by op_oheader.ordnum descending" 
      ) .
 
    QUERY qoopTextfile:QUERY-PREPARE 
      ("FOR EACH op_textfile, each ttop_oheader where ttop_oheader.coy = op_textfile.coy AND ttop_oheader.atekey = op_textfile.atekey NO-LOCK" 
      ) .   
  */ 
    FOR EACH bop_oHeader /* header filter say company? */ NO-LOCK.
      ASSIGN
        cHeaderLocationName = ""
        cHeaderSpecialInstructions = "".
      FOR FIRST boa_location 
          FIELD(name)
          WHERE boa_location.company = bop_oHeader.coy
            AND boa_location.brncod  = bop_oHeader.branch NO-LOCK:
        ASSIGN
          cHeaderLocationName = boa_location.name.
      END.
      FOR FIRST bop_textfile 
          FIELD(txtstr)
          WHERE bop_textfile.coy = bop_oHeader.coy
            AND bop_textfile.atekey  = bop_oHeader.atekey NO-LOCK:
        DO iloop = 1 to EXTENT(bop_textfile.txtstr):
          IF bop_textfile.txtstr[iloop] <> "" THEN  
            ASSIGN cHeaderSpecialInstructions = cHeaderSpecialInstructions + bop_textfile.txtstr[iloop].
        END.
      END.
      CREATE ttop_oheader.
      BUFFER-COPY bop_oheader TO ttop_oHeader ASSIGN clocationName = cHeaderLocationName cedtSpecialInstruc = cHeaderSpecialInstructions.
    END.
     
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
