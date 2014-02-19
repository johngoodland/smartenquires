
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
 
CLASS op.beopsupplierheader :
  {op/ttopoheader.i}
  {op/dsopsupplierheader.i}
    
    DEFINE PRIVATE VARIABLE daopsupplierheader AS CLASS op.daopsupplierheader NO-UNDO.
    
    CONSTRUCTOR PUBLIC beopsupplierheader () :
        
        daopsupplierheader = NEW op.daopsupplierheader () .
                
    END CONSTRUCTOR . 
     
    DESTRUCTOR PUBLIC beopsupplierheader() :
    
        DELETE OBJECT daopsupplierheader NO-ERROR .
    
    END DESTRUCTOR .
     
    METHOD PUBLIC VOID fetchSupplierHeaderData (   
        INPUT piCompany      AS INTEGER, 
        INPUT pcSupplier     AS CHARACTER,
        INPUT pcBranch       AS CHARACTER,
        INPUT pcRqstby       AS CHARACTER,
        INPUT pcxChar2       AS CHARACTER,
        INPUT cFilterName    AS CHARACTER,
        OUTPUT DATASET FOR dsop_supplierheader) :
    
        daopsupplierheader:fetchSupplierHeaderData
            (  INPUT piCompany ,
               INPUT pcSupplier,
               INPUT pcBranch,
               INPUT pcRqstby,
               INPUT pcxChar2,
               INPUT cFilterName, 
               OUTPUT DATASET dsop_supplierheader) .
            
    END METHOD .    
    
    
    

END CLASS .
